part of 'forecast_cubit.dart';

@immutable
sealed class ForecastState {}

final class ForecastInitial extends ForecastState {}

final class ForecastLoading extends ForecastState {}

class ForecastWeatherLoaded extends ForecastState {
  final List<ForecastWeather> forecastWeather;
  ForecastWeatherLoaded({required this.forecastWeather});
}

final class WeatherError extends ForecastState {
  final String message;
  WeatherError(this.message);
}
