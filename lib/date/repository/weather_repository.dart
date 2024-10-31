import 'package:weather_app_with_bloc/date/api/weather_api.dart';
import 'package:weather_app_with_bloc/date/model/current_weather.dart';
import 'package:weather_app_with_bloc/date/model/forecast_weather.dart';

class WeatherRepository {
  final WeatherApi weatherApi;

  WeatherRepository(this.weatherApi);

  Future<CurrentWeather> getWeatherData(String city) async {
    final currentWeather = await weatherApi.getWeatherData(city);
    return currentWeather;
  }

  Future<List<ForecastWeather>> getWeatherForecast(String cityName) async {
    final forecastWeather = await weatherApi.getWeatherForecast(cityName);
    return forecastWeather;
  }
}
