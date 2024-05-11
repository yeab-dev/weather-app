import 'package:intl/intl.dart';
import 'package:weather/weather/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather/view/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFF90F8FF),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              "CityName",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Color(0xFF00274A),
              ),
            ),
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
                    DateCard(DateFormat.MMMMEEEEd().format(DateTime.now())),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                    const WeatherType("Sunny"),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
                    CurrentTemperature(state.currentWeather?.temperature),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                    const CurrenWeatherSummary(),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
                    MoreInfoCard(
                      windSpeed: state.currentWeather?.windSpeed,
                      relativeHumidity: state.currentWeather?.relativeHumidity,
                      cloudCover: state.currentWeather?.cloudCover,
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
                    WeeklyForecast(
                      minTemperatures: state.dailyWeather?.minTemperature,
                      maxTemperatures: state.dailyWeather?.maxTemperature,
                      days: state.dailyWeather?.days,
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
