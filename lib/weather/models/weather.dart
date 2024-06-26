import 'package:weather/weather/repositories/weather_repository.dart';

sealed class Weather {
  Weather();
}

class CurrentWeather extends Weather {
  CurrentWeather({
    required this.location,
    required this.weatherType,
    required this.cloudCover,
    required this.temperature,
    required this.windSpeed,
    required this.relativeHumidity,
  });

  factory CurrentWeather.fromJson(
      Map<String, dynamic> json, String location, WeatherType weatherType) {
    return CurrentWeather(
        weatherType: weatherType,
        location: location,
        cloudCover: json["cloud_cover"],
        temperature: json["temperature_2m"],
        windSpeed: json["wind_speed_10m"],
        relativeHumidity: json["relative_humidity_2m"]);
  }
  String location;
  final double temperature;
  final double windSpeed;
  final int relativeHumidity;
  final int cloudCover;
  final WeatherType weatherType;
}

class DailyWeather extends Weather {
  DailyWeather({
    required this.showersSum,
    required this.days,
    required this.rainSum,
    required this.windSpeed,
    required this.maxTemperature,
    required this.minTemperature,
    required this.precipitationHours,
    // required this.precipitationSums,
    required this.weatherType,
  });

  factory DailyWeather.fromJson(
    Map<String, dynamic> json,
    List<WeatherType> weatherType,
  ) {
    return DailyWeather(
      days: (json["time"] as List).map((e) => (DateTime.parse(e))).toList(),
      windSpeed: (json["wind_speed_10m_max"] as List)
          .map((e) => (e as double))
          .toList(),
      showersSum:
          (json["showers_sum"] as List).map((e) => (e as double)).toList(),
      weatherType: weatherType,
      maxTemperature:
          (json["temperature_2m_max"] as List).map((e) => e as double).toList(),
      minTemperature:
          (json["temperature_2m_min"] as List).map((e) => e as double).toList(),
      precipitationHours: (json["precipitation_hours"] as List)
          .map((e) => e as double)
          .toList(),
      rainSum: (json["rain_sum"] as List).map((e) => e as double).toList(),
    );
  }
  final List<double> rainSum;
  final List<double> showersSum;
  final List<double> windSpeed;
  final List<double> maxTemperature;
  final List<double> minTemperature;
  final List<WeatherType> weatherType;
  final List<double> precipitationHours;
  // final List<double> precipitationSums;
  final List<DateTime> days;
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
