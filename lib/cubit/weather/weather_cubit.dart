import 'package:flutter_bloc/flutter_bloc.dart';
import '../../service/weather_service.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherService _weatherService;

  WeatherCubit(this._weatherService) : super(WeatherInitial());

  Future<void> getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      final weatherModel = await _weatherService.getCurrentWeather(cityName: cityName);
      emit(WeatherLoaded(weatherModel));
    } catch (e) {
      emit(WeatherFailure(e.toString()));
    }
  }
}
