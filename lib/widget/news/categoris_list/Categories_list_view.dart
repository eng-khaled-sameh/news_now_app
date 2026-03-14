import 'package:flutter/material.dart';
import 'package:news_now/models/categories_model.dart';
import 'package:news_now/widget/news/categoris_list/category_card.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key});

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView>
    with SingleTickerProviderStateMixin {
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

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final double startDelay = index * 0.1;
          final double endDelay = (startDelay + 0.4).clamp(0.0, 1.0);

          final Animation<double> opacityAnim =
              Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: Interval(startDelay, endDelay, curve: Curves.easeIn),
                ),
              );

          final Animation<Offset> slideAnim =
              Tween<Offset>(
                begin: const Offset(0.5, 0.0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: Interval(
                    startDelay,
                    endDelay,
                    curve: Curves.easeOutCubic,
                  ),
                ),
              );

          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Opacity(
                opacity: opacityAnim.value,
                child: SlideTransition(position: slideAnim, child: child),
              );
            },
            child: NewsCardCategory(category: categories[index]),
          );
        },
      ),
    );
  }
}
