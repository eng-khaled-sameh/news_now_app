import 'package:flutter/material.dart';
import 'package:news_now/news_now_app.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('news_cache');
  runApp(const NewsNowApp());
}
