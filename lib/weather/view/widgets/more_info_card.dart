import 'package:flutter/material.dart';

class MoreInfoCard extends StatelessWidget {
  const MoreInfoCard(
      {required this.windSpeed,
      required this.relativeHumidity,
      required this.cloudCover,
      super.key});
  final double? windSpeed;
  final int? relativeHumidity;
  final int? cloudCover;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.2,
        width: MediaQuery.sizeOf(context).width * 0.8,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: const Color(0xFF00274A),
                borderRadius: BorderRadius.circular(15)),
            child: Row(
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
                      "${windSpeed}m/s",
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
                      "$relativeHumidity%",
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
                      "$cloudCover%",
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
          ),
        ),
      ),
    );
  }
}
