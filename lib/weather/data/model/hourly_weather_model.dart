import 'package:equatable/equatable.dart';
import 'weather.dart';

class HourlyWeatherModel extends Equatable {
  final int temp;
  final int dt;
  final List<Weather> weather;

  const HourlyWeatherModel(
      {required this.temp, required this.dt, required this.weather});

  factory HourlyWeatherModel.fromJson(Map<String, dynamic> json) {
    return HourlyWeatherModel(
        temp: json['temp'].round(),
        dt: json['dt'],
        weather: List<Weather>.from(json['weather'].map((e) => Weather.fromJson(e))));
  }

  @override
  List<Object?> get props => [temp, dt, weather];
}
