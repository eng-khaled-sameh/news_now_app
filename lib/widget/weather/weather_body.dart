import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_now/cubit/weather/weather_cubit.dart';
import 'package:news_now/cubit/weather/weather_state.dart';
import 'package:news_now/service/weather_service.dart';
import 'package:news_now/cubit/news/news_cubit.dart';
import 'package:news_now/service/news_service.dart';
import 'package:news_now/widget/weather/weather_search_bar.dart';
import 'package:news_now/views/weather_view.dart';
import 'package:news_now/widget/news/news_banner/animated_news_banner.dart';

class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(WeatherService(Dio())),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text(
            'Weather',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black87,
              letterSpacing: 0.5,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black87),
        ),
        body: Container(
          width: double.infinity,
          color: const Color(0xFFF8F9FA),
          child: SafeArea(
            child: Builder(
              builder: (context) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 8.0,
                    ),
                    child: WeatherSearchBar(
                      onSearch: (value) {
                        if (value.isNotEmpty) {
                          context.read<WeatherCubit>().getWeather(
                            cityName: value,
                          );
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: BlocProvider(
                      create: (context) => NewsCubit(NewsService())..getNews(category: 'general'),
                      child: const AnimatedNewsBanner(),
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<WeatherCubit, WeatherState>(
                      builder: (context, state) {
                        if (state is WeatherInitial) {
                          return const Center(
                            child: Text(
                              "Please search for a city",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        } else if (state is WeatherLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.orange,
                            ),
                          );
                        } else if (state is WeatherLoaded) {
                          return WeatherView(weatherModel: state.weather);
                        } else if (state is WeatherFailure) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                state.error,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
