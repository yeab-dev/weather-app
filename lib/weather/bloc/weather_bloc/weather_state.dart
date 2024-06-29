part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();
  @override
  List<Object?> get props => [];
}

final class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

final class WeatherFetchSuccess extends WeatherState {
  const WeatherFetchSuccess(
      {required this.currentWeather, required this.dailyWeather});

  final CurrentWeather currentWeather;
  final DailyWeather dailyWeather;
}

final class WeatherFetchFailure extends WeatherState {
  const WeatherFetchFailure({required this.error});
  final String error;
}

final class WeatherFetchInProgress extends WeatherState {
  const WeatherFetchInProgress();
}
