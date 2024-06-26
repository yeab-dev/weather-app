import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:weather/weather/view/daily_forecast/daily_forecast.dart';
import 'package:weather/weather/bloc/weather_bloc.dart';
import 'package:weather/weather/view/home/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
          ),
          body: switch (state.status) {
            WeatherStatus.initial => const Center(
                child: CircularProgressIndicator(),
              ),
            WeatherStatus.failure =>
              const Center(child: Text("Something went wrong")),
            WeatherStatus.inProgress => const Center(
                child: CircularProgressIndicator(),
              ),
            WeatherStatus.success => SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Text(
                      state.currentWeather.location!,
                      style: const TextStyle(
                        color: Color(0xFF00274A),
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.01,
                    ),
                    DateCard(
                      DateFormat.MMMMEEEEd().format(DateTime.now()),
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      height: MediaQuery.sizeOf(context).height * 0.04,
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                    WeatherType(state.currentWeather.weatherType.formattedName),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                    CurrentTemperature(state.currentWeather.temperature),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                    const CurrenWeatherSummary(),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
                    MoreInfoCard(
                      windSpeed: state.currentWeather.windSpeed,
                      relativeHumidity: state.currentWeather.relativeHumidity,
                      cloudCover: state.currentWeather.cloudCover,
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Daily Forecast",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF00274A),
                                fontSize: 18),
                          ),
                          IconButton(
                            icon: const Icon(Icons.navigate_next),
                            onPressed: () {
                              Navigator.of(context)
                                  .push(DailyForeCastPage.route(
                                context.read<DailyWeatherBloc>(),
                              ));
                            },
                          )
                        ],
                      ),
                    ),
                    BlocBuilder<DailyWeatherBloc, DailyWeatherState>(
                      builder: (context, state) {
                        return WeeklyForecast(
                          minTemperatures: state.dailyWeather.minTemperature,
                          maxTemperatures: state.dailyWeather.maxTemperature,
                          days: state.dailyWeather.days,
                        );
                      },
                    ),
                  ],
                ),
              )
          },
        );
      },
    );
  }
}
