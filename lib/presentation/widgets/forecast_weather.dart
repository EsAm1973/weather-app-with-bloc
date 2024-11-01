import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_with_bloc/date/model/forecast_weather.dart';

class BuildForecastWidget extends StatelessWidget {
  final ForecastWeather forecastWeather;

  const BuildForecastWidget({super.key, required this.forecastWeather});

  @override
  Widget build(BuildContext context) {
    final dayOfWeek =
        DateFormat('E').format(DateTime.parse(forecastWeather.dtTxt));

    final temperature = forecastWeather.main.temp;

    final formattedTemperature =
        temperature != null ? (temperature - 273.15).toInt() : 'N/A';

    final description = forecastWeather.weather.isNotEmpty
        ? forecastWeather.weather[0].description
        : 'No description available';
    String imagePath = '';
    if (description == 'clear sky') {
      imagePath = 'assets/clear sky.png';
    } else if (description == 'few clouds') {
      imagePath = 'assets/few clouds.png';
    } else if (description == 'scattered clouds') {
      imagePath = 'assets/scattered clouds.png';
    } else if (description == 'broken clouds') {
      imagePath = 'assets/broken clouds.png';
    } else if (description == 'overcast clouds') {
      imagePath = 'assets/overcast clouds.png';
    } else if (description == 'light rain' ||
        description == 'moderate rain' ||
        description == 'heavy intensity rain') {
      imagePath = 'assets/light rain.png';
    } else if (description == 'shower rain') {
      imagePath = 'assets/shower rain.png';
    } else if (description == 'thunderstorm') {
      imagePath = 'assets/thunderstorm.png';
    } else if (description == 'snow') {
      imagePath = 'assets/snow.png';
    }

    return SizedBox(
      width: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dayOfWeek,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 5),
          Image.asset(
            imagePath,
            width: 60,
            height: 60,
          ),
          const SizedBox(height: 5),
          Text(
            "$formattedTemperature°",
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
