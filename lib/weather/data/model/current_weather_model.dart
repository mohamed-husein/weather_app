import 'package:equatable/equatable.dart';

import 'weather.dart';

class CurrentWeatherModel extends Equatable {
  final int temp;
  final int humidity;
  final int clouds;
  final double windSpeed;
  final double feelsLike;
  final double uvi;
  final List<Weather> weather;

  const CurrentWeatherModel({
    required this.temp,
    required this.humidity,
    required this.clouds,
    required this.windSpeed,
    required this.weather,
    required this.feelsLike,
    required this.uvi,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
        temp: json['temp'].round(),
        humidity: json['humidity'],
        clouds: json['clouds'],
        windSpeed: json['wind_speed'],
        feelsLike: json['feels_like'].toDouble(),
        uvi: json['uvi'].toDouble(),
        weather: List<Weather>.from(
            json['weather'].map((e) => Weather.fromJson(e))));
  }

  @override
  List<Object?> get props => [temp, humidity, clouds, windSpeed, weather];
}
