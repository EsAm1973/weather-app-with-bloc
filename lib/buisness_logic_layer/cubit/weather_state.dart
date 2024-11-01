part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

class CurrentWeatherLoaded extends WeatherState {
  final CurrentWeather currentWeather;
  CurrentWeatherLoaded({required this.currentWeather});
}



final class WeatherError extends WeatherState {
  final String message;
  WeatherError(this.message);
}