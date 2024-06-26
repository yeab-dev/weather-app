import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/weather/models/location.dart';

import 'package:weather/weather/view/daily_forecast/daily_forecast.dart';
import 'package:weather/weather/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather/weather/view/home/widgets/widgets.dart';

import 'package:weather/weather/bloc/location_bloc/location_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    late Location currentLocation;
    return BlocListener<LocationBloc, LocationState>(
      listener: (context, state) {
        switch (state) {
          case LocationInitial():
            context.read<LocationBloc>().add(const LocationRetrivalRequested());
            break;

          case LocationLoadFailure():
            context
                .read<WeatherBloc>()
                .add(WeatherFetchFailed(error: state.error!));
            break;

          case LocationLoadSuccess():
            log("latitude: ${state.location!.latitude}\nlongitude: ${state.location!.longitude}");
            context
                .read<WeatherBloc>()
                .add(WeatherFetchRequested(location: state.location!));
            currentLocation = state.location!;
            break;
        }
      },
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, weatherState) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
            ),
            body: switch (weatherState) {
              WeatherInitial() =>
                const Center(child: CircularProgressIndicator()),
              WeatherFetchFailure() => Center(
                    child: Padding(
                  padding: EdgeInsets.only(
                      left: 30.0,
                      top: MediaQuery.sizeOf(context).height * 0.08),
                  child: Column(
                    children: [
                      Lottie.asset("assets/lotties/connection_error.json",
                          repeat: false),
                      Text(
                        weatherState.error,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<WeatherBloc>().add(
                              WeatherFetchRequested(location: currentLocation));
                        },
                        onLongPress: () {},
                        child: const Text("Retry"),
                      )
                    ],
                  ),
                )),
              WeatherFetchInProgress() =>
                const Center(child: CircularProgressIndicator()),
              WeatherFetchSuccess() => SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Text(
                        weatherState.currentWeather.location,
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
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.01),
                      WeatherType(weatherState
                          .currentWeather.weatherType.formattedName),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.01),
                      CurrentTemperature(
                          weatherState.currentWeather.temperature),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.01),
                      const CurrenWeatherSummary(),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.05),
                      MoreInfoCard(
                        windSpeed: weatherState.currentWeather.windSpeed,
                        relativeHumidity:
                            weatherState.currentWeather.relativeHumidity,
                        cloudCover: weatherState.currentWeather.cloudCover,
                      ),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.02),
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
                                  context.read<WeatherBloc>(),
                                ));
                              },
                            )
                          ],
                        ),
                      ),
                      WeeklyForecast(
                        minTemperatures:
                            weatherState.dailyWeather.minTemperature,
                        maxTemperatures:
                            weatherState.dailyWeather.maxTemperature,
                        days: weatherState.dailyWeather.days,
                      ),
                    ],
                  ),
                )
            },
          );
        },
      ),
    );
  }
}
