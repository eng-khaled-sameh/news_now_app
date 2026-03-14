import 'package:flutter/material.dart';
import 'package:news_now/widget/news/news_list/home_body.dart';
import 'package:news_now/widget/title_app_bar.dart';
import 'package:news_now/widget/weather/weather_action_button.dart';

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
        actions: const [
          WeatherActionButton(),
        ],
      ),
      body: const NewsNowBody(),
    );
  }
}
