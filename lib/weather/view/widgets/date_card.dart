import 'package:flutter/material.dart';

class DateCard extends StatelessWidget {
  const DateCard(this.date, {super.key});

  final String? date;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.5,
        height: MediaQuery.sizeOf(context).height * 0.04,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF00274A),
            borderRadius: BorderRadius.circular(15),
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
