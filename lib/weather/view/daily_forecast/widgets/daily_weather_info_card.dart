import 'package:flutter/material.dart';

class DailyWeatherInfoCard extends StatelessWidget {
  const DailyWeatherInfoCard(
      {required this.day,
      required this.weatherType,
      required this.maxAndMinTemp,
      super.key});

  final String day;
  final String weatherType;
  final String maxAndMinTemp;
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
                day,
                style: TextStyle(color: Theme.of(context).colorScheme.surface),
              )),
          Row(
            children: [
              const Icon(Icons.sunny, color: Colors.yellow),
              const SizedBox(width: 10),
              Text(
                weatherType,
                style: TextStyle(color: Theme.of(context).colorScheme.surface),
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Text(
                maxAndMinTemp,
                style: TextStyle(color: Theme.of(context).colorScheme.surface),
              ))
        ],
      ),
    );
  }
}
