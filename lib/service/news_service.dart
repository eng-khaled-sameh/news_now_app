import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_now/models/artical_model.dart';

class NewsService {
  final dio = Dio();

  Future<List<ArticleModel>> getHeadLines({required String category}) async {
    final String baseUrl = 'https://newsapi.org/v2';
    final String apiKay = '479f7de9231d4b74b4d6fe782fe4ab5a';
    final box = Hive.box('news_cache');

    try {
      var response = await dio.get(
        '$baseUrl/top-headlines?country=us&apiKey=$apiKay&category=$category',
      );
      Map<String, dynamic> josonDataNews = response.data;
      List<dynamic> articles = josonDataNews['articles'];
      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromJson(article);
        articlesList.add(articleModel);
      }
      
      // Save to Hive Cache
      await box.put(category, jsonEncode(articles));

      return articlesList;
    } catch (e) {
      // Load from cache if API request fails (e.g., offline)
      if (box.containsKey(category)) {
        String cachedData = box.get(category);
        List<dynamic> cachedArticles = jsonDecode(cachedData);
        List<ArticleModel> articlesList = [];
        
        for (var article in cachedArticles) {
          ArticleModel articleModel = ArticleModel.fromJson(article);
          articlesList.add(articleModel);
        }
        return articlesList;
      }
      return [];
    }
  }

  Future<List<ArticleModel>> getSearchNews({required String query}) async {
    final String baseUrl = 'https://newsapi.org/v2';
    final String apiKay = '479f7de9231d4b74b4d6fe782fe4ab5a';

    try {
      var response = await dio.get(
        '$baseUrl/everything?q=$query&apiKey=$apiKay',
      );
      Map<String, dynamic> josonDataNews = response.data;
      List<dynamic> articles = josonDataNews['articles'];
      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromJson(article);
        articlesList.add(articleModel);
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
