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
      appBar: AppBar(title: const TitleAppBar()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ArticleImageWidget(imageUrl: article.image),
                  const SizedBox(height: 22),
                  ArticleTitleWidget(title: article.title),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Divider(thickness: 1),
                  ),
                  AuthorInformation(
                    authorName: article.author,
                    publishedAt: article.publishedAt,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Divider(thickness: 1),
                  ),
                  ArticleContentWidget(
                    subTitle: article.subTitle,
                    content: article.content,
                  ),
                  const SizedBox(height: 32),
                  ReadMoreButton(articleUrl: article.url),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
