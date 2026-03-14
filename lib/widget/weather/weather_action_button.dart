import 'package:flutter/material.dart';
import 'package:news_now/widget/weather/weather_body.dart';

class WeatherActionButton extends StatelessWidget {
  const WeatherActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orange.withValues(alpha: 0.15),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: const Icon(
            Icons.sunny,
            color: Colors.orange,
            size: 32,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WeatherBody(),
              ),
            );
          },
        ),
      ),
    );
  }
}
