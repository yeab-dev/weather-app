part of 'weather_bloc.dart';

sealed class WeatherEvent {
  const WeatherEvent();
}

class WeatherFetched extends WeatherEvent {
  const WeatherFetched();
}
