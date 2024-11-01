import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_with_bloc/date/model/forecast_weather.dart';
import 'package:weather_app_with_bloc/date/repository/forecast_repository.dart';

part 'forecast_state.dart';

class ForecastCubit extends Cubit<ForecastState> {
  final ForecastRepository forecastRepository;
  ForecastCubit(this.forecastRepository) : super(ForecastInitial());

  Future<void> fetchForecastWeather(String city) async {
    try {
      emit(
          ForecastLoading()); // Optional: use only if you want separate loading states for forecast
      final forecastWeather = await forecastRepository.getWeatherForecast(city);
      emit(ForecastWeatherLoaded(forecastWeather: forecastWeather));
    } catch (e) {
      emit(WeatherError('Failed to fetch forecast weather: $e'));
    }
  }
}
