import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_with_bloc/buisness_logic_layer/cubit/forecast_cubit.dart';
import 'package:weather_app_with_bloc/buisness_logic_layer/cubit/weather_cubit.dart';
import 'package:weather_app_with_bloc/constants/colors.dart';
import 'package:weather_app_with_bloc/date/model/current_weather.dart';
import 'package:weather_app_with_bloc/date/model/forecast_weather.dart';
import 'package:weather_app_with_bloc/presentation/widgets/current_weather.dart';
import 'package:weather_app_with_bloc/presentation/widgets/forecast_weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String city = 'zagazig';
  TextEditingController searchCity = TextEditingController();
  CurrentWeather? dayWeather;
  List<ForecastWeather>? fiveDaysWeather;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<WeatherCubit>(context).fetchCurrentWeather(city);
    BlocProvider.of<ForecastCubit>(context).fetchForecastWeather(city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.MyBlue,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: searchCity,
                onSubmitted: (value) {
                  city = searchCity.text;
                  BlocProvider.of<WeatherCubit>(context)
                      .fetchCurrentWeather(city);
                  BlocProvider.of<ForecastCubit>(context)
                      .fetchForecastWeather(city);
                },
                decoration: InputDecoration(
                  hintText: 'Search by City',
                  labelText: 'City',
                  suffixIcon: const Icon(Icons.search),
                  suffixIconColor: MyColor.MyWhite,
                  hintStyle: const TextStyle(color: MyColor.MyWhite),
                  labelStyle: const TextStyle(color: MyColor.MyWhite),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: MyColor.MyWhite),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: MyColor.MyWhite),
                  ),
                ),
                style: const TextStyle(color: MyColor.MyWhite),
                cursorColor: MyColor.MyWhite,
              ),
              const SizedBox(
                height: 60,
              ),
              BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherLoading) {
                    return const Center(
                        child: CircularProgressIndicator(color: Colors.yellow));
                  } else if (state is CurrentWeatherLoaded) {
                    dayWeather = state.currentWeather;
                    return BuildCurrentWeatherWidget(
                        currentWeather: dayWeather);
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              const SizedBox(
                height: 50,
              ),
              BlocBuilder<ForecastCubit, ForecastState>(
                builder: (context, state) {
                  if (state is ForecastLoading) {
                    return const Center(
                        child: CircularProgressIndicator(color: Colors.yellow));
                  } else if (state is ForecastWeatherLoaded) {
                    fiveDaysWeather = state.forecastWeather
                        .fold<Map<String, ForecastWeather>>({},
                            (map, forecast) {
                          final date = forecast.dtTxt.substring(
                              0, 10); // Extract the "YYYY-MM-DD" part
                          if (!map.containsKey(date)) {
                            map[date] =
                                forecast; // Retain only first entry per day
                          }
                          return map;
                        })
                        .values
                        .toList()
                        .take(5)
                        .toList();

                    return SizedBox(
                      height: 140,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: fiveDaysWeather!.length,
                        itemBuilder: (context, index) {
                          final forecast = fiveDaysWeather![index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child:
                                BuildForecastWidget(forecastWeather: forecast),
                          );
                        },
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
