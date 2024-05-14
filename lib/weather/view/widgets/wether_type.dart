import 'package:flutter/material.dart';

class WeatherType extends StatelessWidget {
  const WeatherType(this.weather, {super.key});
  final String weather;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        weather,
        style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xFF00274A),
            fontSize: 18),
      ),
    );
  }
}
