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
import 'package:news_now/widget/news/news_banner/news_ticker.dart';
import 'package:news_now/widget/theme_toggle_button.dart';

class WeatherBody extends StatelessWidget {
  final String? initialCity;
  const WeatherBody({super.key, this.initialCity});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = WeatherCubit(WeatherService(Dio()));
        if (initialCity != null && initialCity!.isNotEmpty) {
          cubit.getWeather(cityName: initialCity!);
        }
        return cubit;
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: _buildAppBar(context),
          body: _buildBody(context),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        'Weather',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).textTheme.titleLarge?.color,
          letterSpacing: 0.5,
        ),
      ),
      centerTitle: true,
      actions: const [ThemeToggleButton()],
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Theme.of(context).iconTheme.color),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Builder(
          builder: (context) => Column(
            children: [
              _buildSearchHeader(context),
              _buildNewsTicker(),
              _buildWeatherContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: WeatherSearchBar(
        onSearch: (value) {
          if (value.isNotEmpty) {
            context.read<WeatherCubit>().getWeather(cityName: value);
          }
        },
      ),
    );
  }

  Widget _buildNewsTicker() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: BlocProvider(
        create: (context) => NewsCubit(NewsService())..getNews(category: 'general'),
        child: const NewsTicker(),
      ),
    );
  }

  Widget _buildWeatherContent() {
    return Expanded(
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitial) {
            return _buildStateMessage(context, "Search for a city to see the weather", Icons.search_rounded);
          } else if (state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.orange),
            );
          } else if (state is WeatherLoaded) {
            return WeatherView(weatherModel: state.weather);
          } else if (state is WeatherFailure) {
            return _buildStateMessage(context, state.error, Icons.error_outline_rounded, isError: true);
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildStateMessage(BuildContext context, String message, IconData icon, {bool isError = false}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 64,
              color: isError ? Colors.redAccent.withValues(alpha: 0.5) : Colors.orange.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color?.withValues(alpha: 0.7),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
