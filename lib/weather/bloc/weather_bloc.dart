import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:weather/weather/models/models.dart';
import 'package:weather/weather/repositories/repositories.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(
      {required this.weatherRepository,
      required this.locationRepository,
      required this.dio})
      : super(const WeatherState(
          status: WeatherStatus.initial,
        )) {
    on<WeatherFetched>(onWetherFetched);
  }

  final WeatherRepository weatherRepository;
  final LocationRepository locationRepository;
  final Dio dio;

  Future<void> onWetherFetched(WeatherFetched event, Emitter emit) async {
    if (state.status == WeatherStatus.initial) {
      emit(state.copyWith(status: WeatherStatus.inProgress));
      try {
        await weatherRepository.getWeatherData(
            dio: dio, locationRepository: locationRepository);
        emit(state.copyWith(
            status: WeatherStatus.success,
            currentWeather: weatherRepository.currentWeather,
            dailyWeather: weatherRepository.dailyWeather));
      } catch (e) {
        emit(state.copyWith(status: WeatherStatus.failure));
      }
    }
  }
}
