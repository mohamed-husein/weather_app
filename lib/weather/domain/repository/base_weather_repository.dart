import 'package:weather_app/weather/domain/entities/weather_entities.dart';

abstract class BaseWeatherRepository
{
  Future<WeatherEntities> getWeatherByCountryName(String countryName);
}
