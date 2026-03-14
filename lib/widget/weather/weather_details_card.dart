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
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildWeatherDetail(
            icon: Icons.water_drop_outlined,
            label: 'Humidity',
            value: '$humidity%',
            iconColor: Colors.blueAccent,
          ),
          _buildWeatherDetail(
            icon: Icons.arrow_upward_rounded,
            label: 'Max Temp',
            value: '${maxTemp.round()}°',
            iconColor: Colors.orange,
          ),
          _buildWeatherDetail(
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
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

