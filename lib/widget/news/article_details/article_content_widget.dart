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
          Container(
            padding: const EdgeInsets.only(left: 12),
            decoration: const BoxDecoration(
              border: Border(left: BorderSide(color: Colors.orange, width: 4)),
            ),
            child: Text(
              subTitle!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                height: 1.4,
                color: Theme.of(
                  context,
                ).textTheme.bodyLarge?.color?.withValues(alpha: 0.7),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
        if (content != null && content!.isNotEmpty) ...[
          Text(
            content!,
            style: TextStyle(
              fontSize: 17,
              height: 1.7,
              letterSpacing: 0.3,
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
          ),
        ],
      ],
    );
  }
}
