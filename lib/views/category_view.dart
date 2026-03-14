import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_now/cubit/news/news_cubit.dart';
import 'package:news_now/service/news_service.dart';
import 'package:news_now/widget/news/categoris_list/category_title_bar.dart';
import 'package:news_now/widget/news/news_list/news_list_section.dart';
import 'package:news_now/widget/news/news_banner/news_ticker.dart';
import 'package:news_now/widget/news/news_banner/sticky_header_delegate.dart';
import 'package:news_now/widget/title_app_bar.dart';
import 'package:news_now/widget/theme_toggle_button.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(NewsService())..getNews(category: category),
      child: Scaffold(
        appBar: AppBar(
          title: const TitleAppBar(),
          actions: const [
            ThemeToggleButton(),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: StickyHeaderDelegate(
                  child: const Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: NewsTicker(),
                  ),
                  height: 64,
                ),
              ),
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
