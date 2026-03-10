import 'package:flutter/material.dart';
import 'package:news_now/views/home_now_app.dart';

void main() {
  runApp(NewsNowApp());
}

class NewsNowApp extends StatelessWidget {
  const NewsNowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeNewsNowApp();
  }
}
