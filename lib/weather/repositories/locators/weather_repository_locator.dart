import 'package:dio/dio.dart';
import 'package:weather/weather/repositories/_repositories.dart';
import 'package:weather/weather/repositories/services/services.dart';

abstract class WeatherRepositoryLocator {
  static inject() {
    InjectionService.locator.registerSingleton<WeatherRepository>(
        WeatherRepository(),
        instanceName: "weatherRepository");

    InjectionService.locator.registerSingleton<Dio>(Dio(), instanceName: "dio");
  }

  static WeatherRepository get weatherRepository {
    return InjectionService.locator<WeatherRepository>(
        instanceName: "weatherRepository");
  }

  static Dio get dio {
    return InjectionService.locator<Dio>(instanceName: "dio");
  }
}
