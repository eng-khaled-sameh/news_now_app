import 'package:flutter/material.dart';
import 'package:news_now/widget/news/categoris_list/Categories_list_view.dart';
import 'package:news_now/widget/news/list_news/news_list_view_builder.dart';

class NewsNowBody extends StatelessWidget {
  const NewsNowBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: CategoriesListView()),
          NewsListViewBuilder(category: 'general'),
        ],
      ),
    );
  }
}
