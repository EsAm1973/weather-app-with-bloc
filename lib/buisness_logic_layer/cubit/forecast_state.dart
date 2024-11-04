part of 'forecast_cubit.dart';

@immutable
abstract class ForecastState {}

class ForecastInitial extends ForecastState {}

class ForecastLoading extends ForecastState {}

class ForecastWeatherLoaded extends ForecastState {
  final List<ForecastWeather> forecastWeather;

  ForecastWeatherLoaded({required this.forecastWeather});
}

class ForecastError extends ForecastState {
  final String message;

  ForecastError(this.message);
}
