import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_now/cubit/news/news_cubit.dart';
import 'package:news_now/cubit/news/news_state.dart';
import 'package:news_now/widget/news/list_news/news_list_view.dart';

class NewsListSection extends StatelessWidget {
  const NewsListSection({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsLoaded) {
          return NewsListView(articles: state.articles);
        } else if (state is NewsFailure) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Text(
                state.error,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          );
        } else {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
