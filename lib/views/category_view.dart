import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_now/cubit/news/news_cubit.dart';
import 'package:news_now/service/news_service.dart';
import 'package:news_now/widget/news/categoris_list/category_title_bar.dart';
import 'package:news_now/widget/news/news_list/news_list_section.dart';
import 'package:news_now/widget/title_app_bar.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(NewsService())..getNews(category: category),
      child: Scaffold(
        appBar: AppBar(title: const TitleAppBar()),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: CategoryTitleBar(category: category),
              ),
              NewsListSection(category: category),
            ],
          ),
        ),
      ),
    );
  }
}
