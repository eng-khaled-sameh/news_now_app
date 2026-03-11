import 'package:dio/dio.dart';
import 'package:news_now/models/artical_model.dart';

class NewsService {
  final dio = Dio();

  Future<List<ArticleModel>> getHeadLines({required String category}) async {
    try {
      var response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=479f7de9231d4b74b4d6fe782fe4ab5a&category=$category',
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
