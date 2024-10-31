import 'package:weather_app_with_bloc/date/model/main_model.dart';
import 'package:weather_app_with_bloc/date/model/weather.dart';
import 'package:weather_app_with_bloc/date/model/wind.dart';

class ForecastWeather {
  final int dt;
  final Main main;
  final List<Weather> weather;
  final Wind wind;
  final String dtTxt;

  ForecastWeather({
    required this.dt,
    required this.main,
    required this.weather,
    required this.wind,
    required this.dtTxt,
  });

  factory ForecastWeather.fromJson(Map<String, dynamic> json) {
    return ForecastWeather(
      dt: json['dt'],
      main: Main.fromJson(json['main']),
      weather: (json['weather'] as List)
          .map((item) => Weather.fromJson(item))
          .toList(),
      wind: Wind.fromJson(json['wind']),
      dtTxt: json['dt_txt'],
    );
  }
}
