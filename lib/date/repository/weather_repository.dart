import 'package:weather_app_with_bloc/date/api/weather_api.dart';
import 'package:weather_app_with_bloc/date/model/current_weather.dart';

class WeatherRepository {
  final ApiService apiService;

  WeatherRepository(this.apiService);

  Future<CurrentWeather> getCurrentWeather(String city) async {
    final jsonData = await apiService.getWeatherData(city, 'weather');
    return CurrentWeather.fromJson(jsonData);
  }
}
