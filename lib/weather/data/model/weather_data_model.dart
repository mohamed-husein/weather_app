import 'current_weather_model.dart';
import 'daily_weather_model.dart';
import 'hourly_weather_model.dart';

class WeatherDataModel {
  final CurrentWeatherModel? current;
  final List<HourlyWeatherModel>? hourly;
  final List<DailyWeatherModel>? daily;

  const WeatherDataModel(
      [  this.current,   this.daily,    this.hourly]);

  factory WeatherDataModel.fromJson(Map<String, dynamic> json) {
    return WeatherDataModel(
       CurrentWeatherModel.fromJson(json['current']),
       
            List<DailyWeatherModel>.from(json['daily'].map((e) => DailyWeatherModel.fromJson(e))),
   
            List<HourlyWeatherModel>.from(json['hourly'].map((e) => HourlyWeatherModel.fromJson(e))));
  }
}
