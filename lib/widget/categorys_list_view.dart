import 'package:flutter/material.dart';
import 'package:news_now/models/categories_model.dart';
import 'package:news_now/widget/news_card_category.dart';

class CategorysListView extends StatelessWidget {
  CategorysListView({super.key});

  final List<CategoriesModel> categories = [
    CategoriesModel(
      imageCategoryUrl: 'assets/images/Sports.png',
      titleCategory: 'Sports',
    ),
    CategoriesModel(
      imageCategoryUrl: 'assets/images/Health.png',
      titleCategory: 'Health',
    ),
    CategoriesModel(
      imageCategoryUrl: 'assets/images/Science.png',
      titleCategory: 'Science',
    ),
    CategoriesModel(
      imageCategoryUrl: 'assets/images/Technology.png',
      titleCategory: 'Technology',
    ),
    CategoriesModel(
      imageCategoryUrl: 'assets/images/Business.png',
      titleCategory: 'Business',
    ),
    CategoriesModel(
      imageCategoryUrl: 'assets/images/Entertaiment.png',
      titleCategory: 'Entertaiment',
    ),
    CategoriesModel(
      imageCategoryUrl: 'assets/images/General.png',
      titleCategory: 'General',
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
