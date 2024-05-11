import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather/app.dart';
import 'package:weather/observer.dart';

void main() {
  Bloc.observer = WeatherObserver();
  runApp(App());
}
