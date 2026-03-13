import 'package:equatable/equatable.dart';
import '../../models/weather_model.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherModel weather;

  const WeatherLoaded(this.weather);

  @override
  List<Object> get props => [weather];
}

class WeatherFailure extends WeatherState {
  final String error;

  const WeatherFailure(this.error);

  @override
  List<Object> get props => [error];
}
