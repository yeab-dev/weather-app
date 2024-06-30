import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather/weather/models/models.dart';

enum WeatherType {
  clearSky,
  mainlyClear,
  partlyCloudy,
  overcast,
  fog,
  rimeFog,
  lightDrizzle,
  moderateDrizzle,
  dendseDrizzle,
  lightFreezingDrizzle,
  denseFreezingDrizzle,
  slightRain,
  moderateRain,
  heavyRain,
  lightFreezingRain,
  heavyFreezingRain,
  slightSnowFall,
  moderateSnowFall,
  heavySnowFall,
  snowGrains,
  slightRainShowers,
  moderateRainShowers,
  violentRainShowers,
  slightSnowShowers,
  heavySnowShowers,
  moderateThunderstorm,
  slightThunderstorm,
  thunderStormWithSlightHail,
  thunderStormWithHeavyHail,
  unknown;

  String get formattedName {
    String string = "";
    string = string + name[0].toUpperCase();
    for (int i = 1; i < name.length; i++) {
      if (name.substring(i, i + 1) == name.substring(i, i + 1).toUpperCase()) {
        string = "$string ${name.substring(i, i + 1).toLowerCase()}";
      } else {
        string = string + name[i];
      }
    }
    return string;
  }
}

class WeatherRepository {
  Future<List<Weather>> getWeatherData({
    required Dio dio,
    required Location currentLocation,
  }) async {
    List<Weather> weatherData = <Weather>[];
    const weatherUri = "https://api.open-meteo.com/v1/forecast?";
    try {
      final weatherResponse = await dio.get(weatherUri, queryParameters: {
        "latitude": "${currentLocation.latitude}",
        "longitude": "${currentLocation.longitude}",
        "current":
            "temperature_2m,relative_humidity_2m,wind_speed_10m,cloud_cover,weather_code",
        "daily":
            "weather_code,temperature_2m_max,temperature_2m_min,rain_sum,precipitation_hours,wind_speed_10m_max,showers_sum",
      });
      const geocodingUri = "https://geocode.maps.co/reverse?";
      final geoCodingResponse = await dio.get(geocodingUri, queryParameters: {
        "lat": "${currentLocation.latitude}",
        "lon": "${currentLocation.longitude}",
        "api_key": "6640996435980120701243jsz798863"
      });
      final weatherJson = weatherResponse.data as Map<String, dynamic>;

      final geoCodingJson = geoCodingResponse.data as Map<String, dynamic>;
      final addressName = geoCodingJson["address"];
      log(addressName.toString());
      final location = addressName["town"] == null
          ? "${addressName["city"]}, ${addressName["country"]}"
          : "${addressName["town"]}, ${addressName["country"]}";
      weatherData.add(CurrentWeather.fromJson(
        weatherJson["current"],
        location,
        getWeatherType(weatherJson["current"]["weather_code"]),
      ));

      weatherData.add(DailyWeather.fromJson(
          weatherJson["daily"],
          (weatherJson["daily"]["weather_code"] as List)
              .map((e) => getWeatherType(e))
              .toList()));
    } on DioException {
      return Future.error("Connection Error!");
    }
    return weatherData;
  }

  WeatherType getWeatherType(int weatherCode) {
    switch (weatherCode) {
      case 0:
        return WeatherType.clearSky;
      case 1:
        weatherCode;
        return WeatherType.mainlyClear;
      case 2:
        return WeatherType.partlyCloudy;
      case 3:
        return WeatherType.overcast;
      case 45:
        return WeatherType.fog;
      case 48:
        return WeatherType.rimeFog;
      case 51:
        return WeatherType.lightDrizzle;
      case 53:
        return WeatherType.moderateDrizzle;
      case 55:
        return WeatherType.dendseDrizzle;
      case 61:
        return WeatherType.slightRain;
      case 63:
        return WeatherType.moderateRain;
      case 65:
        return WeatherType.heavyRain;
      case 66:
        return WeatherType.lightFreezingRain;
      case 67:
        return WeatherType.heavyFreezingRain;
      case 71:
        return WeatherType.slightSnowFall;
      case 73:
        return WeatherType.moderateSnowFall;
      case 75:
        return WeatherType.heavySnowFall;
      case 77:
        return WeatherType.snowGrains;
      case 80:
        return WeatherType.slightRainShowers;
      case 81:
        return WeatherType.moderateRainShowers;
      case 82:
        return WeatherType.violentRainShowers;
      case 85:
        return WeatherType.slightSnowShowers;
      case 86:
        return WeatherType.heavySnowShowers;
      case 95:
        return WeatherType.slightThunderstorm;
      case 96:
        return WeatherType.thunderStormWithSlightHail;
      case 99:
        return WeatherType.thunderStormWithHeavyHail;
      case int():
        return WeatherType.unknown;
    }
  }
}
