import 'package:weather/weather/models/location.dart';

sealed class Weather {
  Weather({
    this.maxTemperature,
    this.minTemperature,
    required this.location,
  });

  Location location;
  List<double>? maxTemperature;
  List<double>? minTemperature;
}

class DailyWeather extends Weather {
  DailyWeather({
    required this.days,
    required super.location,
    required super.minTemperature,
    required super.maxTemperature,
    required this.precipitationHours,
    required this.precipitationSums,
    required this.weatherCodes,
  });

  factory DailyWeather.fromJson(
    Map<String, dynamic> json,
    Location location,
  ) {
    return DailyWeather(
      location: location,
      days: (json["time"] as List).map((e) => (DateTime.parse(e))).toList(),
      weatherCodes:
          (json["weather_code"] as List).map((e) => e as int).toList(),
      maxTemperature:
          (json["temperature_2m_max"] as List).map((e) => e as double).toList(),
      minTemperature:
          (json["temperature_2m_min"] as List).map((e) => e as double).toList(),
      precipitationHours: (json["precipitation_hours"] as List)
          .map((e) => e as double)
          .toList(),
      precipitationSums:
          (json["precipitation_sum"] as List).map((e) => e as double).toList(),
    );
  }

  final List<int> weatherCodes;
  final List<double> precipitationHours;
  final List<double> precipitationSums;
  final List<DateTime> days;
}

class CurrentWeather extends Weather {
  CurrentWeather({
    required super.location,
    required this.cloudCover,
    required this.temperature,
    required this.windSpeed,
    required this.relativeHumidity,
  });

  factory CurrentWeather.fromJson(
      Map<String, dynamic> json, Location location) {
    return CurrentWeather(
        location: location,
        cloudCover: json["cloud_cover"],
        temperature: json["temperature_2m"],
        windSpeed: json["wind_speed_10m"],
        relativeHumidity: json["relative_humidity_2m"]);
  }
  final double temperature;
  final double windSpeed;
  final int relativeHumidity;
  final int cloudCover;
}
// class HourlyWeather extends Weather {
//   HourlyWeather({
//     required this.hours,
//     required this.temperatures,
//   });

//   factory HourlyWeather.fromJson(Map<String, dynamic> json) {
//     return HourlyWeather(
//       hours: json["hours"],
//       temperatures: json["temperatures"],
//     );
//   }
//   final List<DateTime> hours;
//   final List<double> temperatures;
// }
