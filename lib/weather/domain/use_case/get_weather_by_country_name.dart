import 'package:weather_app/weather/domain/entities/weather_entities.dart';
import 'package:weather_app/weather/domain/repository/base_weather_repository.dart';

class GetWeatherByCountryName
{
  final BaseWeatherRepository repository;

  GetWeatherByCountryName(this.repository);

  Future<WeatherEntities> execute(String countryName)async{
    return await repository.getWeatherByCountryName(countryName);
  }
}