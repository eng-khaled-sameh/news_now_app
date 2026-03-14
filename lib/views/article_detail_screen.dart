import 'package:flutter/material.dart';
import 'package:news_now/models/artical_model.dart';
import 'package:news_now/widget/news/article_details/article_content_widget.dart';
import 'package:news_now/widget/news/article_details/article_image_widget.dart';
import 'package:news_now/widget/news/article_details/article_title_widget.dart';
import 'package:news_now/widget/news/article_details/read_more_button.dart';
import 'package:news_now/widget/news/article_details/author_information.dart';
import 'package:share_plus/share_plus.dart';

class ArticleDetailScreen extends StatelessWidget {
  final ArticleModel article;

  const ArticleDetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_rounded),
            onPressed: () {
              final shareText =
                  '${article.title}\n\nRead more at:\n${article.url ?? ""}';
              Share.share(shareText);
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ArticleImageWidget(imageUrl: article.image),
                  const SizedBox(height: 28),
                  ArticleTitleWidget(title: article.title),
                  const SizedBox(height: 24),
                  AuthorInformation(
                    authorName: article.author,
                    publishedAt: article.publishedAt,
                  ),
                  const SizedBox(height: 28),
                  ArticleContentWidget(
                    subTitle: article.subTitle,
                    content: article.content,
                  ),
                  const SizedBox(height: 48),
                  ReadMoreButton(articleUrl: article.url),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
