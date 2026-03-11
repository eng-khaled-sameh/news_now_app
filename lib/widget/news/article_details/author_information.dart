import 'package:flutter/material.dart';

class AuthorInformation extends StatelessWidget {
  final String? authorName;
  final String? publishedAt;

  const AuthorInformation({super.key, this.authorName, this.publishedAt});

  @override
  Widget build(BuildContext context) {
    String formattedDate = "Unknown Date";
    if (publishedAt != null && publishedAt!.length >= 10) {
      formattedDate = publishedAt!.substring(0, 10);
    }

    return Row(
      children: [
        Icon(Icons.person, color: Colors.blue, size: 32),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                authorName ?? "Unknown Author",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                formattedDate,
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
