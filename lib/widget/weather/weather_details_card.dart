import 'package:flutter/material.dart';

class WeatherDetailsCard extends StatelessWidget {
  final int humidity;
  final double maxTemp;
  final double minTemp;

  const WeatherDetailsCard({
    super.key,
    required this.humidity,
    required this.maxTemp,
    required this.minTemp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white.withValues(alpha: 0.05)
                : Colors.grey.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.grey.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildWeatherDetail(
            context: context,
            icon: Icons.water_drop_outlined,
            label: 'Humidity',
            value: '$humidity%',
            iconColor: Colors.blueAccent,
          ),
          _buildWeatherDetail(
            context: context,
            icon: Icons.arrow_upward_rounded,
            label: 'Max Temp',
            value: '${maxTemp.round()}°',
            iconColor: Colors.orange,
          ),
          _buildWeatherDetail(
            context: context,
            icon: Icons.arrow_downward_rounded,
            label: 'Min Temp',
            value: '${minTemp.round()}°',
            iconColor: Colors.teal,
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherDetail({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String value,
    required Color iconColor,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: iconColor, size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.titleLarge?.color,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).textTheme.bodySmall?.color,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

