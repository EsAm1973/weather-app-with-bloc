part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class CurrentWeatherLoaded extends WeatherState {
  final CurrentWeather currentWeather;

  CurrentWeatherLoaded({required this.currentWeather});
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);
}