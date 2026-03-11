import 'package:flutter/material.dart';
import 'package:news_now/widget/news/list_news/news_list_view_builder.dart';
import 'package:news_now/widget/title_app_bar.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: TitleAppBar()),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Text(
                category,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            NewsListViewBuilder(category: category),
          ],
        ),
      ),
    );
  }
}
