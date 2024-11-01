import 'package:flutter/material.dart';
import 'package:weather_app_with_bloc/constants/colors.dart';
import 'package:weather_app_with_bloc/date/model/current_weather.dart';

class BuildCurrentWeatherWidget extends StatelessWidget {
  const BuildCurrentWeatherWidget({super.key, required this.currentWeather});
  final CurrentWeather? currentWeather;
  @override
  Widget build(BuildContext context) {
    final temperature = currentWeather!.main.temp;
    final minTempreture = currentWeather!.main.tempMin;
    final maxTempreture = currentWeather!.main.tempMax;
    final formattedTemperature =
        temperature != null ? (temperature - 273.15).toInt() : 'N/A';
    final formattedMinTemperature =
        minTempreture != null ? (minTempreture - 273.15).toInt() : 'N/A';
    final formattedMaxTemperature =
        maxTempreture != null ? (maxTempreture - 273.15).toInt() : 'N/A';
    final description = currentWeather!.weather.isNotEmpty
        ? currentWeather!.weather[0].description
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
    return Column(
      children: [
        Text(
          currentWeather!.name,
          style: const TextStyle(
              color: MyColor.MyWhite,
              fontSize: 40,
              fontWeight: FontWeight.bold),
        ),
        Image.asset(
          imagePath,
          height: 150,
          width: 150,
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: '$formattedTemperature',
              style: const TextStyle(
                color: MyColor.MyWhite,
                fontSize: 40,
              )),
          const TextSpan(
              text: '°C',
              style: TextStyle(
                color: MyColor.MyWhite,
                fontSize: 40,
              )),
        ])),
        Text(
          'H:$formattedMaxTemperature L:$formattedMinTemperature',
          style: const TextStyle(color: MyColor.MyWhite, fontSize: 20),
        )
      ],
    );
  }
}
