import 'package:flutter/material.dart';
import 'package:news_now/widget/news/news_list/home_body.dart';
import 'package:news_now/widget/title_app_bar.dart';
import 'package:news_now/widget/theme_toggle_button.dart';
import 'package:news_now/widget/news/news_search/news_search_delegate.dart';

class HomeNewsNowApp extends StatelessWidget {
  const HomeNewsNowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          title: const TitleAppBar(),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: NewsSearchDelegate(),
                );
              },
            ),
            const ThemeToggleButton(),
          ],
        ),
        body: const NewsNowBody(),
      ),
    );
  }
}
