import 'dart:convert';
import 'package:weather_app_with_bloc/constants/string.dart';
import 'package:weather_app_with_bloc/date/model/current_weather.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  Future<CurrentWeather> getWeatherData(String city) async {
    final finalUrl = '$baseUrl/weather?q=$city&appid=$apiKey';
    final response = await http.get(Uri.parse(finalUrl));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return CurrentWeather.fromJson(jsonData);
    } else {
      throw Exception('Can not load weather data');
    }
  }
}
