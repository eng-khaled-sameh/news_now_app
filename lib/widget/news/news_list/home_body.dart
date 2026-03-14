import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_now/cubit/news/news_cubit.dart';
import 'package:news_now/service/news_service.dart';
import 'package:news_now/widget/news/news_banner/animated_news_banner.dart';
import 'package:news_now/widget/news/categoris_list/categories_list_view.dart';
import 'package:news_now/widget/news/news_list/news_list_section.dart';

class NewsNowBody extends StatelessWidget {
  const NewsNowBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NewsCubit(NewsService())..getNews(category: 'general'),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: CategoriesListView()),
            const SliverToBoxAdapter(child: AnimatedNewsBanner()),
            const NewsListSection(category: 'general'),
          ],
        ),
      ),
    );
  }
}
