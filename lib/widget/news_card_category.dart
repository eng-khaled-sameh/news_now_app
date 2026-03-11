import 'package:flutter/material.dart';
import 'package:news_now/models/categories_model.dart';

class NewsCardCategory extends StatelessWidget {
  const NewsCardCategory({super.key, required this.category});
  final CategoriesModel category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(right: 4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadiusGeometry.circular(8),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(category.imageCategoryUrl),
          ),
        ),
        width: 155,
        height: 95,
        child: Center(
          child: Text(
            category.titleCategory,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
