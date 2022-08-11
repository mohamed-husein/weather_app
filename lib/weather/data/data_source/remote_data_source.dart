import 'package:dio/dio.dart';
import 'package:weather_app/core/constants/constants.dart';
import 'package:weather_app/weather/data/model/weather_model.dart';

abstract class BaseRemoteDataSource
{
  Future<WeatherModel?> getWeatherByCountryName(String countryName);
}

class RemoteDataSource implements BaseRemoteDataSource{
  @override
  Future<WeatherModel?> getWeatherByCountryName(String countryName)async {
    try {
      var response = await Dio().get('${AppConstants.baseUrl}weather?q=$countryName&appid=${AppConstants.apiKey}');
      return WeatherModel.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}