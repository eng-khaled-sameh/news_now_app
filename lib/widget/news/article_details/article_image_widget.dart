import 'package:flutter/material.dart';

class ArticleImageWidget extends StatelessWidget {
  final String? imageUrl;

  const ArticleImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: imageUrl != null && imageUrl!.isNotEmpty
            ? Image.network(
                imageUrl!,
                height: 240,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const SizedBox(
                  height: 240,
                  child: Center(
                    child: Icon(Icons.broken_image, size: 80, color: Colors.grey),
                  ),
                ),
              )
            : Image.asset(
                'assets/images/test.avif',
                height: 240,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}

