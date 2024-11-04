import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_with_bloc/date/model/current_weather.dart';
import 'package:weather_app_with_bloc/date/repository/weather_repository.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherCubit(this.weatherRepository) : super(WeatherInitial());

  Future<void> fetchCurrentWeather(String city) async {
    try {
      emit(WeatherLoading());
      final currentWeather = await weatherRepository.getCurrentWeather(city);
      emit(CurrentWeatherLoaded(currentWeather: currentWeather));
    } catch (e) {
      emit(WeatherError('Failed to fetch current weather: $e'));
    }
  }
}
