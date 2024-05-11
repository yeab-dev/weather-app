import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather/bloc/weather_bloc.dart';
import 'package:weather/weather/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather/view/home_page.dart';

class App extends MaterialApp {
  App({super.key})
      : super(
            home: BlocProvider(
          create: (context) => WeatherBloc(
            weatherRepository: WeatherRepository(),
            locationRepository: LocationRepository(),
            dio: Dio(),
          )..add(const WeatherFetched()),
          child: const HomePage(),
        ));
}
