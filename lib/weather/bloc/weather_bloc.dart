import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/weather/models/models.dart';
import 'package:weather/weather/repositories/repositories.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class CurrentWeatherBloc extends Bloc<WeatherEvent, CurrentWeatherState> {
  CurrentWeatherBloc(
      {required this.weatherRepository,
      required this.locationRepository,
      required this.dio})
      : super(CurrentWeatherState(
          currentWeather: weatherRepository.currentWeather,
          status: WeatherStatus.initial,
        )) {
    on<WeatherFetched>(onWetherFetched);
  }

  final WeatherRepository weatherRepository;
  final LocationRepository locationRepository;
  final Dio dio;

  Future<void> onWetherFetched(WeatherFetched event, Emitter emit) async {
    if (state.status == WeatherStatus.initial) {
      emit(state.copyWith(status: WeatherStatus.success));
    }
  }
}

class DailyWeatherBloc extends Bloc<WeatherEvent, DailyWeatherState> {
  DailyWeatherBloc(
      {required this.weatherRepository,
      required this.locationRepository,
      required this.dio})
      : super(DailyWeatherState(
          dailyWeather: weatherRepository.dailyWeather,
          status: WeatherStatus.initial,
        )) {
    on<WeatherFetched>(onWetherFetched);
  }

  final WeatherRepository weatherRepository;
  final LocationRepository locationRepository;
  final Dio dio;

  Future<void> onWetherFetched(WeatherFetched event, Emitter emit) async {
    emit(state.copyWith(status: WeatherStatus.success));
  }
}
