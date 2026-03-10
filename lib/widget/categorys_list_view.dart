import 'package:flutter/material.dart';
import 'package:news_now/widget/news_card_category.dart';

class CategorysListView extends StatelessWidget {
  const CategorysListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return NewsCardCategory();
        },
      ),
    );
  }
}
