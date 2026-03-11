import 'package:flutter/material.dart';

class ArticleTitleWidget extends StatelessWidget {
  final String title;

  const ArticleTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w800,
        fontFamily: 'Serif',
        height: 1.3,
      ),
    );
  }
}
