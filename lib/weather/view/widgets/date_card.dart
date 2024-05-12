import 'package:flutter/material.dart';

class DateCard extends StatelessWidget {
  const DateCard(this.date,
      {required this.width, required this.height, super.key});

  final String? date;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF00274A),
            borderRadius: BorderRadius.circular(9),
          ),
          child: Center(
            child: Text(
              "$date",
              style: const TextStyle(
                  color: Color(0xFF90F8FF), fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
