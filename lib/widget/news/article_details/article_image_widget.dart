import 'package:flutter/material.dart';

class ArticleImageWidget extends StatelessWidget {
  final String? imageUrl;

  const ArticleImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: imageUrl != null && imageUrl!.isNotEmpty
          ? Image.network(
              imageUrl!,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const SizedBox(
                height: 200,
                child: Center(
                  child: Icon(Icons.broken_image, size: 80, color: Colors.grey),
                ),
              ),
            )
          : Image.asset(
              'assets/images/test.avif',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
    );
  }
}
