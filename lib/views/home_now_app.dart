import 'package:flutter/material.dart';
import 'package:news_now/widget/news/list_news/home_body.dart';
import 'package:news_now/widget/title_app_bar.dart';
import 'package:news_now/widget/weather/weather_body.dart';

class HomeNewsNowApp extends StatelessWidget {
  const HomeNewsNowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: const TitleAppBar(),
        actions: [
          Builder(
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.15),
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
            },
          ),
        ],
      ),
      body: const NewsNowBody(),
    );
  }
}
