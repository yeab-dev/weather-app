import 'package:flutter/material.dart';
import 'package:qweather_icons/qweather_icons.dart';

class MoreInfoCardForDailyWeather extends StatelessWidget {
  const MoreInfoCardForDailyWeather(
      {required this.maxTemperaturesOfTheWeek,
      required this.minTemperaturesOfTheWeek,
      required this.windSpeedsOfTheWeek,
      required this.humidityValuesOfTheWeek,
      required this.cloudCoverValuesOfTheWeek,
      super.key});
  final List<int> maxTemperaturesOfTheWeek;
  final List<int> minTemperaturesOfTheWeek;

  final List<double> windSpeedsOfTheWeek;
  final List<double> humidityValuesOfTheWeek;
  final List<double> cloudCoverValuesOfTheWeek;
  @override
  Widget build(BuildContext context) {
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
                      Icon(
                        QWeatherIcons.tag_cloudy.iconData,
                        size: 45,
                        color: themeData.colorScheme.surface,
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
                            "${maxTemperaturesOfTheWeek[1]}/${minTemperaturesOfTheWeek[1]}",
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
                            "${windSpeedsOfTheWeek[0]}km/h",
                            style: const TextStyle(color: Color(0xFF90F8FF)),
                          ),
                          const Text(
                            "Wind",
                            style: TextStyle(color: Color(0xFF90F8FF)),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.water_drop_outlined,
                            color: const Color(0xFF90F8FF),
                            size: MediaQuery.sizeOf(context).height * 0.05,
                          ),
                          Text(
                            "${humidityValuesOfTheWeek[1]}%",
                            style: const TextStyle(color: Color(0xFF90F8FF)),
                          ),
                          const Text(
                            "Humidity",
                            style: TextStyle(color: Color(0xFF90F8FF)),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cloud_outlined,
                            color: const Color(0xFF90F8FF),
                            size: MediaQuery.sizeOf(context).height * 0.05,
                          ),
                          Text(
                            "${cloudCoverValuesOfTheWeek[1]}%",
                            style: const TextStyle(color: Color(0xFF90F8FF)),
                          ),
                          const Text(
                            "Cloud cover",
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
