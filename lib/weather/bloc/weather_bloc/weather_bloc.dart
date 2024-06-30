import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/weather/models/models.dart';
import 'package:weather/weather/repositories/_repositories.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(
      {required this.weatherRepository,
      required this.locationRepository,
      required this.dio})
      : super(const WeatherInitial()) {
    on<WeatherFetchRequested>(_onWetherFetchRequested);
    on<WeatherFetchFailed>(_onWeatherFetchFailed);
  }

  final WeatherRepository weatherRepository;
  final LocationRepository locationRepository;
  final Dio dio;

  void _onWetherFetchRequested(
      WeatherFetchRequested event, Emitter emit) async {
    emit(const WeatherFetchInProgress());
    List<Weather> weatherData = await WeatherRepositoryLocator.weatherRepository
        .getWeatherData(
            dio: WeatherRepositoryLocator.dio, currentLocation: event.location!)
        .onError((error, stackTrace) {
      log("$error\n $stackTrace");
      emit(WeatherFetchFailure(error: error.toString()));
      return <Weather>[];
    });
    if (weatherData.isNotEmpty) {
      emit(WeatherFetchSuccess(
          currentWeather: weatherData[0] as CurrentWeather,
          dailyWeather: weatherData[1] as DailyWeather));
    }
  }

  void _onWeatherFetchFailed(WeatherFetchFailed event, Emitter emit) {
    emit(WeatherFetchFailure(error: event.error!));
  }
}
