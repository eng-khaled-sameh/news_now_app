import 'package:flutter/material.dart';
import 'package:news_now/models/weather_model.dart';
import 'package:news_now/widget/weather/weather_header.dart';
import 'package:news_now/widget/weather/weather_icon.dart';
import 'package:news_now/widget/weather/weather_temp.dart';
import 'package:news_now/widget/weather/weather_details_card.dart';

class WeatherView extends StatelessWidget {
  final WeatherModel weatherModel;

  const WeatherView({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WeatherHeader(
              cityName: weatherModel.cityName,
              date: weatherModel.date,
              condition: weatherModel.condition,
            ),
            const SizedBox(height: 12),
            WeatherIcon(iconUrl: weatherModel.iconUrl),
            const SizedBox(height: 8),
            WeatherTemp(tempC: weatherModel.tempC),
            const SizedBox(height: 24),
            WeatherDetailsCard(
              humidity: weatherModel.humidity,
              maxTemp: weatherModel.maxTemp,
              minTemp: weatherModel.minTemp,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

