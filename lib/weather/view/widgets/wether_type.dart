import 'package:flutter/material.dart';

class WeatherType extends StatelessWidget {
  const WeatherType(this.type, {super.key});
  final String type;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Sunny",
        style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xFF00274A),
            fontSize: 18),
      ),
    );
  }
}
