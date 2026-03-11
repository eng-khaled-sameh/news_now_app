import 'package:flutter/material.dart';

class ArticleContentWidget extends StatelessWidget {
  final String? subTitle;
  final String? content;

  const ArticleContentWidget({super.key, this.subTitle, this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (subTitle != null && subTitle!.isNotEmpty) ...[
          Text(
            subTitle!,
            style: const TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 90, 89, 89),
            ),
          ),
          const SizedBox(height: 16),
        ],
        if (content != null && content!.isNotEmpty) ...[
          Text(
            content!,
            style: const TextStyle(
              fontSize: 18,
              height: 1.55,
              color: Colors.black,
            ),
          ),
        ],
      ],
    );
  }
}
