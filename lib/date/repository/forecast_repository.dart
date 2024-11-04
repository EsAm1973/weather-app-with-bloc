import 'package:weather_app_with_bloc/date/api/weather_api.dart';
import 'package:weather_app_with_bloc/date/model/forecast_weather.dart';

class ForecastRepository {
  final ApiService apiService;

  ForecastRepository(this.apiService);

  Future<List<ForecastWeather>> getWeatherForecast(String city) async {
    final jsonData = await apiService.get(city, 'forecast');
    return (jsonData['list'] as List)
        .map((data) => ForecastWeather.fromJson(data))
        .toList();
  }
}
