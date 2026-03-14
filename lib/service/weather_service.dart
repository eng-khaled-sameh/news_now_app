import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:news_now/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  WeatherService(this.dio);

  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '9d79a85b89cd44dc9ab222842261103';

  Future<WeatherModel> getCurrentWeather({
    required String cityName,
  }) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1',
      );

      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ??
          'oops there was an error, try later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("oops there was an error, try later");
    }
  }
}
