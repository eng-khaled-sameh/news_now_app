import 'package:flutter/material.dart';

class WeatherTemp extends StatelessWidget {
  final double tempC;

  const WeatherTemp({super.key, required this.tempC});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${tempC.round()}°C',
      style: TextStyle(
        fontSize: 80,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).textTheme.displayLarge?.color,
        height: 1.0,
      ),
    );
  }
}

