import 'package:flutter/material.dart';
import 'package:news_now/models/artical_model.dart';
import 'package:news_now/widget/news/article_details/article_content_widget.dart';
import 'package:news_now/widget/news/article_details/article_image_widget.dart';
import 'package:news_now/widget/news/article_details/article_title_widget.dart';
import 'package:news_now/widget/news/article_details/read_more_button.dart';
import 'package:news_now/widget/news/article_details/author_information.dart';
import 'package:news_now/widget/title_app_bar.dart';

class ArticleDetailScreen extends StatelessWidget {
  final ArticleModel article;

  const ArticleDetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const TitleAppBar(),
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
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

