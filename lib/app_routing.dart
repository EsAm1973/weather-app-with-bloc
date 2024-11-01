import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_with_bloc/buisness_logic_layer/cubit/forecast_cubit.dart';
import 'package:weather_app_with_bloc/buisness_logic_layer/cubit/weather_cubit.dart';
import 'package:weather_app_with_bloc/date/api/forecast_api.dart';
import 'package:weather_app_with_bloc/date/api/weather_api.dart';
import 'package:weather_app_with_bloc/date/repository/forecast_repository.dart';
import 'package:weather_app_with_bloc/date/repository/weather_repository.dart';
import 'package:weather_app_with_bloc/presentation/screens/weather_screen.dart';

class AppRouting {
  final WeatherCubit weatherCubit =
      WeatherCubit(WeatherRepository(WeatherApi()));
  final ForecastCubit forecastCubit =
      ForecastCubit(ForecastRepository(ForecastApi()));

  Route? onGenereteRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
                  BlocProvider<WeatherCubit>.value(
                    value: weatherCubit,
                  ),
                  BlocProvider<ForecastCubit>.value(
                    value: forecastCubit,
                  ),
                ], child: const WeatherScreen()));
      default:
        return null;
    }
  }
}
