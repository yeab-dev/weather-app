import 'package:intl/intl.dart';
import 'package:weather/weather/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather/view/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFF90F8FF),
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
                      height: MediaQuery.sizeOf(context).height * 0.02,
                    ),
                    DateCard(
                      DateFormat.MMMMEEEEd().format(DateTime.now()),
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      height: MediaQuery.sizeOf(context).height * 0.04,
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                    WeatherType(state.currentWeather.weatherType.formattedName),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
                    CurrentTemperature(state.currentWeather.temperature),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                    const CurrenWeatherSummary(),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
                    MoreInfoCard(
                      windSpeed: state.currentWeather.windSpeed,
                      relativeHumidity: state.currentWeather.relativeHumidity,
                      cloudCover: state.currentWeather.cloudCover,
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
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
