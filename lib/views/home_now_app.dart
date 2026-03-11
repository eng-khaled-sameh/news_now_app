import 'package:flutter/material.dart';
import 'package:news_now/widget/news/list_news/home_body.dart';
import 'package:news_now/widget/title_app_bar.dart';

class HomeNewsNowApp extends StatelessWidget {
  const HomeNewsNowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(centerTitle: true, title: TitleAppBar()),
        body: NewsNowBody(),
      ),
    );
  }
}
