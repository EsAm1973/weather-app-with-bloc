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
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
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
                          child:
                              CircularProgressIndicator(color: Colors.yellow));
                    } else if (state is CurrentWeatherLoaded) {
                      final dayWeather = state.currentWeather;
                      return BuildCurrentWeatherWidget(
                          currentWeather: dayWeather);
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
                BlocBuilder<ForecastCubit, ForecastState>(
                  builder: (context, state) {
                    if (state is ForecastLoading) {
                      return const Center(
                          child:
                              CircularProgressIndicator(color: Colors.yellow));
                    } else if (state is ForecastWeatherLoaded) {
                      final fiveDaysWeather = state.forecastWeather;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Text("5-Day Forecast",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: fiveDaysWeather.length ?? 0,
                            itemBuilder: (context, index) {
                              final forecast = fiveDaysWeather[index];
                              return BuildForecastWidget(
                                  forecastWeather: forecast);
                            },
                          ),
                        ],
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
      ),
    );
  }
}
