import 'package:flutter/material.dart';

class AuthorInformation extends StatelessWidget {
  const AuthorInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.person, color: Colors.blue, size: 32),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Kyra Santicola",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),

              Text(
                "2026-03-10",
                style: TextStyle(
                  color: Color.fromARGB(255, 90, 89, 89),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
