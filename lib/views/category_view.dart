import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_now/cubit/news/news_cubit.dart';
import 'package:news_now/service/news_service.dart';
import 'package:news_now/widget/news/list_news/news_list_section.dart';
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
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Container(
                        width: 4,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        category,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              NewsListSection(category: category),
            ],
          ),
        ),
      ),
    );
  }
}
