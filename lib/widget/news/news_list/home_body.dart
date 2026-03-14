import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_now/cubit/news/news_cubit.dart';
import 'package:news_now/service/news_service.dart';
import 'package:news_now/widget/news/news_banner/animated_news_banner.dart';
import 'package:news_now/widget/news/news_banner/news_ticker.dart';
import 'package:news_now/widget/news/news_banner/sticky_header_delegate.dart';
import 'package:news_now/widget/news/categoris_list/categories_list_view.dart';
import 'package:news_now/widget/news/news_list/news_list_section.dart';
import 'package:news_now/widget/weather/weather_search_bar.dart';
import 'package:news_now/widget/weather/weather_body.dart';

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
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 4.0,
                  bottom: 8.0,
                ),
                child: WeatherSearchBar(
                  onSearch: (city) {
                    if (city.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WeatherBody(initialCity: city),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 13)),
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

            SliverToBoxAdapter(child: CategoriesListView()),
            const SliverToBoxAdapter(child: AnimatedNewsBanner()),
            const NewsListSection(category: 'general'),
          ],
        ),
      ),
    );
  }
}
