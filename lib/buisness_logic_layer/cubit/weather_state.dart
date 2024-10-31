part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

class CurrentWeatherLoaded extends WeatherState {
  final CurrentWeather? currentWeather;

  CurrentWeatherLoaded({required this.currentWeather});
}

class ForecasrWeatherLoaded extends WeatherState {
  final List<ForecastWeather>? forecastWeather;

  ForecasrWeatherLoaded({required this.forecastWeather});
}
