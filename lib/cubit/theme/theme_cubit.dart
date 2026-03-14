import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light) {
    _loadTheme();
  }

  void _loadTheme() {
    final box = Hive.box('news_cache');
    final isDark = box.get('isDark', defaultValue: false);
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  void toggleTheme() {
    final box = Hive.box('news_cache');
    final isDark = state == ThemeMode.dark;
    box.put('isDark', !isDark);
    emit(!isDark ? ThemeMode.dark : ThemeMode.light);
  }
}
