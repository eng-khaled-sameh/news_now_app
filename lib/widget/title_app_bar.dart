import 'package:flutter/material.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'News ',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        Text(
          'Now',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}
