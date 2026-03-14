import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_now/cubit/news/news_cubit.dart';
import 'package:news_now/cubit/news/news_state.dart';
import 'package:url_launcher/url_launcher.dart';
import 'banner_image_widget.dart';
import 'banner_content_widget.dart';

class AnimatedNewsBanner extends StatefulWidget {
  const AnimatedNewsBanner({super.key});

  @override
  State<AnimatedNewsBanner> createState() => _AnimatedNewsBannerState();
}

class _AnimatedNewsBannerState extends State<AnimatedNewsBanner> {
  int _currentIndex = 0;
  Timer? _timer;

  void _startTimer(int itemCount) {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (mounted && itemCount > 0) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % itemCount;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        if (state is NewsLoaded && state.articles.isNotEmpty) {
          _startTimer(state.articles.length);
        }
      },
      builder: (context, state) {
        if (state is NewsLoaded && state.articles.isNotEmpty) {
          if (_timer == null) {
            _startTimer(state.articles.length);
          }
          final article = state.articles[_currentIndex];

          return GestureDetector(
            onTap: () {
              if (article.url != null) {
                _launchUrl(article.url!);
              }
            },
            child: Container(
              margin: const EdgeInsets.only(top: 16.0, bottom: 8.0),
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
                border: Border.all(color: Colors.grey.withValues(alpha: 0.1)),
              ),
              child: Row(
                children: [
                  BannerImageWidget(imageUrl: article.image),
                  const SizedBox(width: 12),
                  Expanded(
                    child: BannerContentWidget(
                      title: article.title,
                      currentIndex: _currentIndex,
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
