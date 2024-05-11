import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather/weather/models/models.dart';
import 'package:weather/weather/repositories/location_repository.dart';

class WeatherRepository {
  late CurrentWeather currentWeather;
  late DailyWeather dailyWeather;
  Future<void> getWeatherData({
    required Dio dio,
    required LocationRepository locationRepository,
  }) async {
    final currentLocation = await locationRepository.getCurrentPosition();
    const uri = "https://api.open-meteo.com/v1/forecast?";
    final response = await dio.get(uri, queryParameters: {
      "latitude": "${currentLocation.latitude}",
      "longitude": "${currentLocation.longitude}",
      "current":
          "temperature_2m,relative_humidity_2m,wind_speed_10m,cloud_cover",
      "daily":
          "weather_code,temperature_2m_max,temperature_2m_min,precipitation_sum,precipitation_hours",
    });
    final json = response.data as Map<String, dynamic>;
    currentWeather = CurrentWeather.fromJson(json["current"], currentLocation);
    dailyWeather = DailyWeather.fromJson(json["daily"], currentLocation);
    log(dailyWeather.weatherCodes.toString());
  }
}
