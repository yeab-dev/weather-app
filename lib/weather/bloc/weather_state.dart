part of 'weather_bloc.dart';

enum WeatherStatus { initial, success, inProgress, failure }

class WeatherState {
  const WeatherState(
      {required this.status, this.currentWeather, this.dailyWeather});

  WeatherState copyWith({
    WeatherStatus? status,
    CurrentWeather? currentWeather,
    DailyWeather? dailyWeather,
  }) {
    return WeatherState(
      status: status ?? this.status,
      currentWeather: currentWeather ?? this.currentWeather,
      dailyWeather: dailyWeather ?? this.dailyWeather,
    );
  }

  final WeatherStatus status;
  final CurrentWeather? currentWeather;
  final DailyWeather? dailyWeather;
}
