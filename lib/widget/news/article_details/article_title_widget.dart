import 'package:flutter/material.dart';

class ArticleTitleWidget extends StatelessWidget {
  final String title;

  const ArticleTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w900,
        letterSpacing: -0.5,
        height: 1.3,
        color: Colors.black87,
      ),
    );
  }
}

