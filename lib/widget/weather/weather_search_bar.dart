import 'package:flutter/material.dart';

class WeatherSearchBar extends StatelessWidget {
  const WeatherSearchBar({super.key, required this.onSearch});

  final Function(String) onSearch;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSearch,
      style: const TextStyle(color: Colors.black87),
      decoration: InputDecoration(
        hintText: 'Search for a city...',
        hintStyle: const TextStyle(color: Colors.black54),
        prefixIcon: const Icon(Icons.search, color: Colors.black54),
        filled: true,
        fillColor: Colors.grey.withValues(alpha: 0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
      ),
    );
  }
}

