import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather/bloc/weather_bloc.dart';
import 'package:weather/weather/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather/view/home_page.dart';

class App extends MaterialApp {
  App(
      {required this.weatherRepository,
      required this.locationRepository,
      required this.dio,
      super.key})
      : super(
            home: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (BuildContext context) => CurrentWeatherBloc(
                    weatherRepository: weatherRepository,
                    locationRepository: locationRepository,
                    dio: dio)
                  ..add(const WeatherFetched())),
            BlocProvider(
                create: (BuildContext context) => DailyWeatherBloc(
                    weatherRepository: weatherRepository,
                    locationRepository: locationRepository,
                    dio: dio)
                  ..add(const WeatherFetched())),
          ],
          child: const HomePage(),
        ));

  final WeatherRepository weatherRepository;
  final Dio dio;
  final LocationRepository locationRepository;
}
