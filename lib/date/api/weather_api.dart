import 'dart:convert';
import 'package:weather_app_with_bloc/constants/string.dart';
import 'package:weather_app_with_bloc/date/model/current_weather.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_with_bloc/date/model/forecast_weather.dart';

class WeatherApi {
  Future<CurrentWeather> getWeatherData(String city) async {
    final finalUrl = '$baseUrl/weather?q=$city&appid=$apiKey';
    final response = await http.get(Uri.parse(finalUrl));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      print(response.body);
      return CurrentWeather.fromJson(jsonData);
    } else {
      throw Exception('Can not load weather data');
    }
  }

  Future<List<ForecastWeather>> getWeatherForecast(String cityName) async {
    final url = Uri.parse('$baseUrl/forecast?q=$cityName&appid=$apiKey');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['list'];
      print(response.body);
      return jsonData.map((data) => ForecastWeather.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
