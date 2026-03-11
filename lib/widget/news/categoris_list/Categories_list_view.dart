import 'package:flutter/material.dart';
import 'package:news_now/models/categories_model.dart';
import 'package:news_now/widget/news/categoris_list/category_card.dart';

class CategoriesListView extends StatelessWidget {
  CategoriesListView({super.key});

  final List<CategoriesModel> categories = [
    CategoriesModel(
      imageCategoryUrl: 'assets/images/Sports.png',
      titleCategory: 'sports',
    ),
    CategoriesModel(
      imageCategoryUrl: 'assets/images/Health.png',
      titleCategory: 'health',
    ),
    CategoriesModel(
      imageCategoryUrl: 'assets/images/Science.png',
      titleCategory: 'science',
    ),
    CategoriesModel(
      imageCategoryUrl: 'assets/images/Technology.png',
      titleCategory: 'technology',
    ),
    CategoriesModel(
      imageCategoryUrl: 'assets/images/Business.png',
      titleCategory: 'business',
    ),
    CategoriesModel(
      imageCategoryUrl: 'assets/images/Entertaiment.png',
      titleCategory: 'entertainment',
    ),
    CategoriesModel(
      imageCategoryUrl: 'assets/images/General.png',
      titleCategory: 'general',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return NewsCardCategory(category: categories[index]);
        },
      ),
    );
  }
}
