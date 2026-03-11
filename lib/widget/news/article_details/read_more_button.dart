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
    return Center(
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
        icon: const Icon(Icons.open_in_new),
        label: const Text(
          'Read Full Article',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
