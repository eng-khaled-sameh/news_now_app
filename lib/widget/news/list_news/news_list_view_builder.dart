import 'package:flutter/material.dart';
import 'package:news_now/models/artical_model.dart';
import 'package:news_now/service/news_service.dart';
import 'package:news_now/widget/news/list_news/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});
  final String category;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsService().getHeadLines(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, Snapshot) {
        if (Snapshot.hasData) {
          return NewsListView(articles: Snapshot.data!);
        } else if (Snapshot.hasError) {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Center(
                child: Text(
                  "There was an error. Please try again later.",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        } else {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
