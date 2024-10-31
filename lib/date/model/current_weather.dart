import 'package:weather_app_with_bloc/date/model/main_model.dart';
import 'package:weather_app_with_bloc/date/model/weather.dart';
import 'package:weather_app_with_bloc/date/model/wind.dart';

class CurrentWeather {
  final List<Weather> weather;
  final Main main;
  final Wind wind;
  final int dt;
  final String name;

  CurrentWeather({
    required this.weather,
    required this.main,
    required this.wind,
    required this.dt,
    required this.name,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      weather: (json['weather'] as List)
          .map((item) => Weather.fromJson(item))
          .toList(),
      main: Main.fromJson(json['main']),
      wind: Wind.fromJson(json['wind']),
      dt: json['dt'],
      name: json['name'],
    );
  }
}
