import 'package:weather_app_with_bloc/date/api/weather_api.dart';
import 'package:weather_app_with_bloc/date/model/current_weather.dart';

class WeatherRepository {
  final WeatherApi weatherApi;

  WeatherRepository(this.weatherApi);

  Future<CurrentWeather> getWeatherData(String city) async {
    final currentWeather = await weatherApi.getWeatherData(city);
    return currentWeather;
  }
}
