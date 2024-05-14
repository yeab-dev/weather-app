import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather/app.dart';
import 'package:weather/observer.dart';
import 'package:weather/weather/repositories/location_repository.dart';
import 'package:weather/weather/repositories/weather_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = WeatherObserver();
  final WeatherRepository weatherRepository = WeatherRepository();
  final LocationRepository locationRepository = LocationRepository();
  final Dio dio = Dio();
  await weatherRepository.getWeatherData(
      dio: dio, locationRepository: locationRepository);
  runApp(App(
      weatherRepository: weatherRepository,
      locationRepository: locationRepository,
      dio: dio));
}
