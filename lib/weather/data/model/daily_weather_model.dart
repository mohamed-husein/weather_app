import 'package:equatable/equatable.dart';
import 'temp_model.dart';
import 'weather.dart';

class DailyWeatherModel extends Equatable {
  final Temp temp;
  final int dt;
  final List<Weather> weather;

  const DailyWeatherModel(
      {required this.temp, required this.dt, required this.weather});

  factory DailyWeatherModel.fromJson(Map<String, dynamic> json) {
    return DailyWeatherModel(
        temp: Temp.fromJson(json['temp']),
        dt: json['dt'],
        weather: List<Weather>.from(json['weather'].map((e) => Weather.fromJson(e))));
  }

  @override
  List<Object?> get props => [temp, dt, weather];
}
