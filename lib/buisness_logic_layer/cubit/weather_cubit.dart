import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_with_bloc/date/model/current_weather.dart';
import 'package:weather_app_with_bloc/date/model/forecast_weather.dart';
import 'package:weather_app_with_bloc/date/repository/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;
  CurrentWeather? currentWeather;
  List<ForecastWeather>? forecastWeather;
  WeatherCubit(this.weatherRepository) : super(WeatherInitial());

  CurrentWeather? fetchCurrentWeather(String city) {
    weatherRepository.getWeatherData(city).then((weather) {
      emit(CurrentWeatherLoaded(currentWeather: currentWeather));
    });
    return currentWeather;
  }

  List<ForecastWeather>? fetchForecastWeather(String city) {
    weatherRepository.getWeatherForecast(city).then((forecast) {
      emit(ForecasrWeatherLoaded(forecastWeather: forecastWeather));
    });
    return forecastWeather;
  }
}
