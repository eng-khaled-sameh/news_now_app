import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ReadMoreButton extends StatelessWidget {
  final String? articleUrl;

  const ReadMoreButton({super.key, required this.articleUrl});

  @override
  Widget build(BuildContext context) {
    if (articleUrl == null || articleUrl!.isEmpty) {
      return const SizedBox.shrink();
    }
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.orangeAccent, Colors.deepOrange],
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.deepOrange.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton.icon(
        onPressed: () async {
          final Uri parsedUrl = Uri.parse(articleUrl!);

          try {
            final bool launched = await launchUrl(
              parsedUrl,
              mode: LaunchMode.inAppWebView,
            );

            if (!launched && context.mounted) {
              _showErrorSnackBar(context);
            }
          } catch (e) {
            if (context.mounted) _showErrorSnackBar(context);
          }
        },
        icon: const Icon(Icons.open_in_new, color: Colors.white),
        label: const Text(
          'Read Full Article',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  void _showErrorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Could not launch the article')),
    );
  }
}

