import 'package:weather_app_with_bloc/date/api/forecast_api.dart';
import 'package:weather_app_with_bloc/date/model/forecast_weather.dart';

class ForecastRepository {
  final ForecastApi forecastApi;

  ForecastRepository(this.forecastApi);

  Future<List<ForecastWeather>> getWeatherForecast(String cityName) async {
    final forecastWeather = await forecastApi.getWeatherForecast(cityName);
    return forecastWeather;
  }
}
