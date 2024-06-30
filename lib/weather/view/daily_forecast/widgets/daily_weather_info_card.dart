import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather/repositories/_repositories.dart';
import 'package:weather/weather/view/daily_forecast/widgets/weather_type_icon_chooser.dart';

class DailyWeatherInfoCard extends StatelessWidget {
  const DailyWeatherInfoCard(
      {required this.day,
      required this.weatherType,
      required this.maxTemp,
      required this.minTemp,
      super.key});

  final DateTime day;
  final WeatherType weatherType;
  final double maxTemp;
  final int minTemp;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.09,
      width: MediaQuery.sizeOf(context).width * 0.9,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                DateFormat.EEEE().format(day),
                style: TextStyle(color: Theme.of(context).colorScheme.surface),
              )),
          Row(
            children: [
              Icon(
                chooseIcon(weatherType).iconData,
                color: Theme.of(context).colorScheme.surface,
              ),
              const SizedBox(width: 10),
              Text(
                weatherType.formattedName,
                style: TextStyle(color: Theme.of(context).colorScheme.surface),
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Row(
                children: [
                  Text(
                    "$maxTemp° ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.surface,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "$minTemp°",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.surface),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
