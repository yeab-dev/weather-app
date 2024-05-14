part of 'weather_bloc.dart';

enum WeatherStatus { initial, success, inProgress, failure }

class WeatherState extends Equatable {
  const WeatherState({required this.status});

  WeatherState copyWith({
    WeatherStatus? status,
  }) {
    return WeatherState(
      status: status ?? this.status,
    );
  }

  final WeatherStatus status;
  @override
  List<Object?> get props => [status];
}

class DailyWeatherState extends WeatherState {
  const DailyWeatherState({
    required this.dailyWeather,
    required super.status,
  });
  @override
  WeatherState copyWith({WeatherStatus? status}) {
    super.copyWith(status: status ?? this.status);
    return DailyWeatherState(
        dailyWeather: dailyWeather, status: status ?? this.status);
  }

  final DailyWeather dailyWeather;
}

class CurrentWeatherState extends WeatherState {
  const CurrentWeatherState({
    required this.currentWeather,
    required super.status,
  });

  @override
  WeatherState copyWith({WeatherStatus? status}) {
    super.copyWith(status: status ?? this.status);
    return CurrentWeatherState(
        currentWeather: currentWeather, status: status ?? this.status);
  }

  final CurrentWeather currentWeather;
}
