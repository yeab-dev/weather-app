import 'package:flutter/material.dart';

class CurrentTemperature extends StatelessWidget {
  const CurrentTemperature(this.temperature, {super.key});
  final double temperature;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "${temperature.floor()}°",
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: MediaQuery.sizeOf(context).width * 0.2,
            color: const Color(0xFF00274A)),
      ),
    );
  }
}
