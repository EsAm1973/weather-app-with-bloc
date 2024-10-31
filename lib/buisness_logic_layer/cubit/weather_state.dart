part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

class CurrentWeatherLoaded extends WeatherState {
  final CurrentWeather currentWeather;
  CurrentWeatherLoaded({required this.currentWeather});
}

class ForecastWeatherLoaded extends WeatherState {
  final List<ForecastWeather> forecastWeather;
  ForecastWeatherLoaded({required this.forecastWeather});
}

final class WeatherError extends WeatherState {
  final String message;
  WeatherError(this.message);
}