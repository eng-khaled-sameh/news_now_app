import 'package:flutter/material.dart';

class WeatherTemp extends StatelessWidget {
  final double tempC;

  const WeatherTemp({super.key, required this.tempC});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${tempC.round()}°C',
      style: const TextStyle(
        fontSize: 80,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
        height: 1.0,
      ),
    );
  }
}

