import 'package:flutter/material.dart';
import 'package:weather_app_with_bloc/constants/colors.dart';
import 'package:weather_app_with_bloc/date/model/forecast_weather.dart';

class BuildForecastWidget extends StatelessWidget {
  final ForecastWeather forecastWeather;

  const BuildForecastWidget({super.key, required this.forecastWeather});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColor.MyBlue.withOpacity(0.8),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(forecastWeather.dtTxt, style: TextStyle(color: Colors.white)),
            Text("Temp: ${forecastWeather.main.temp}°K",
                style: TextStyle(color: Colors.white)),
            Text("Humidity: ${forecastWeather.main.humidity}%",
                style: TextStyle(color: Colors.white)),
            Text("Wind: ${forecastWeather.wind.speed} m/s",
                style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
