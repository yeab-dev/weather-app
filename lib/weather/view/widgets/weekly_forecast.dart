import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeeklyForecast extends StatelessWidget {
  const WeeklyForecast({
    required this.minTemperatures,
    required this.maxTemperatures,
    required this.days,
    super.key,
  });
  final List<double>? maxTemperatures;
  final List<double>? minTemperatures;
  final List<DateTime>? days;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
            padding: const EdgeInsets.symmetric(horizontal: 7),
            decoration: BoxDecoration(
                color: const Color(0xFF90F8FF),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFF00274A))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      "${maxTemperatures![index + 1].floor().toString()}°",
                      style: TextStyle(
                          fontSize: MediaQuery.sizeOf(context).height * 0.035),
                    ),
                    Text(
                      "${minTemperatures![index + 1].floor().toString()}°",
                      style: TextStyle(
                          fontSize: MediaQuery.sizeOf(context).height * 0.02),
                    ),
                  ],
                ),
                const Icon(Icons.water_drop_outlined),
                Text(DateFormat.MMMEd().format(days![index + 1])),
              ],
            ),
          );
        },
        itemCount: 6,
      ),
    );
  }
}
