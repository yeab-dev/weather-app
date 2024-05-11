import 'package:flutter/material.dart';

class CurrenWeatherSummary extends StatelessWidget {
  const CurrenWeatherSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Daily Summary",
          style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Color(0xFF00274A),
              fontSize: 18),
        ),
        Text("Lorem ipsum dolor sit amet,"
            " consectetur adipiscing elit."
            "Ut laoreet odio non augue posuere, "
            "sit amet bibendum mi dictum. Fusce ut elit id metus biben"),
      ],
    );
  }
}
