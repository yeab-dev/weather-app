part of 'weather_bloc.dart';

sealed class WeatherEvent {
  const WeatherEvent({required this.location, required this.error});
  final Location? location;
  final String? error;
}

final class WeatherFetchRequested extends WeatherEvent {
  const WeatherFetchRequested({required Location location})
      : super(location: location, error: null);
}

final class WeatherFetchFailed extends WeatherEvent {
  const WeatherFetchFailed({required String error})
      : super(location: null, error: error);
}

final class WeatherFetchSucceeded extends WeatherEvent {
  const WeatherFetchSucceeded({required Location location})
      : super(error: null, location: location);
}
