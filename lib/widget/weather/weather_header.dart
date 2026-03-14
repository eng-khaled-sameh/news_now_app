import 'package:flutter/material.dart';

class WeatherHeader extends StatelessWidget {
  final String date;
  final String condition;
  final String cityName;

  const WeatherHeader({super.key, required this.date, required this.condition, required this.cityName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          cityName,
          style: TextStyle(
            fontSize: 32,
            color: Theme.of(context).textTheme.headlineLarge?.color,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          date,
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          condition,
          style: TextStyle(
            fontSize: 28,
            color: Theme.of(context).textTheme.headlineMedium?.color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

