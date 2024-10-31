import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_with_bloc/date/model/current_weather.dart';
import 'package:weather_app_with_bloc/date/model/forecast_weather.dart';
import 'package:weather_app_with_bloc/date/repository/weather_repository.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherCubit(this.weatherRepository) : super(WeatherInitial());

  Future<void> fetchCurrentWeather(String city) async {
    try {
      emit(WeatherLoading());
      final currentWeather = await weatherRepository.getWeatherData(city);
      emit(CurrentWeatherLoaded(currentWeather: currentWeather));
    } catch (e) {
      emit(WeatherError('Failed to fetch current weather: $e'));
    }
  }

  Future<void> fetchForecastWeather(String city) async {
    try {
      emit(
          WeatherLoading()); // Optional: use only if you want separate loading states for forecast
      final forecastWeather = await weatherRepository.getWeatherForecast(city);
      emit(ForecastWeatherLoaded(forecastWeather: forecastWeather));
    } catch (e) {
      emit(WeatherError('Failed to fetch forecast weather: $e'));
    }
  }
}
