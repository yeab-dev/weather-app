import 'package:flutter/material.dart';
import 'package:qweather_icons/qweather_icons.dart';
import 'package:weather/weather/repositories/_repositories.dart';
import 'package:weather/weather/view/daily_forecast/widgets/weather_type_icon_chooser.dart';

class MoreInfoCardForDailyWeather extends StatelessWidget {
  const MoreInfoCardForDailyWeather({
    required this.weatherType,
    required this.maxTemperature,
    required this.minTemperature,
    required this.windSpeedsOfTheWeek,
    required this.rainSum,
    required this.showerSum,
    super.key,
  });
  final double maxTemperature;
  final int minTemperature;
  final double windSpeedsOfTheWeek;
  final double rainSum;
  final double showerSum;
  final WeatherType weatherType;
  @override
  Widget build(BuildContext context) {
    QWeatherIcons weatherIcon = chooseIcon(weatherType);

    ThemeData themeData = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(
          child: Container(
            margin:
                EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.05),
            height: MediaQuery.sizeOf(context).height * 0.25,
            width: MediaQuery.sizeOf(context).width * 0.9,
            decoration: BoxDecoration(
                color: const Color(0xFF00274A),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Icon(
                            weatherIcon.iconData,
                            size: 45,
                            color: themeData.colorScheme.surface,
                          ),
                          Text(
                            weatherType.formattedName,
                            style: TextStyle(
                              color: themeData.colorScheme.surface,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Tomorrow",
                            style: TextStyle(
                              color: themeData.colorScheme.surface,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            "$maxTemperature/$minTemperature",
                            style: TextStyle(
                              color: themeData.colorScheme.surface,
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.air,
                            color: const Color(0xFF90F8FF),
                            size: MediaQuery.sizeOf(context).height * 0.05,
                          ),
                          Text(
                            "${windSpeedsOfTheWeek}km/h",
                            style: const TextStyle(color: Color(0xFF90F8FF)),
                          ),
                          const Text(
                            "Max Wind Speed",
                            style: TextStyle(color: Color(0xFF90F8FF)),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            QWeatherIcons.tag_accumulated_rain2.iconData,
                            color: const Color(0xFF90F8FF),
                            size: MediaQuery.sizeOf(context).height * 0.04,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "${rainSum}mm",
                              style: const TextStyle(color: Color(0xFF90F8FF)),
                            ),
                          ),
                          const Text(
                            "Expected rain",
                            style: TextStyle(color: Color(0xFF90F8FF)),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            QWeatherIcons.tag_shower_rain.iconData,
                            color: const Color(0xFF90F8FF),
                            size: MediaQuery.sizeOf(context).height * 0.05,
                          ),
                          Text(
                            "${showerSum}mm",
                            style: const TextStyle(color: Color(0xFF90F8FF)),
                          ),
                          const Text(
                            "Shower",
                            style: TextStyle(color: Color(0xFF90F8FF)),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
