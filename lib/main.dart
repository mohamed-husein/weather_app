import 'package:flutter/material.dart';
import 'package:weather_app/weather/data/data_source/remote_data_source.dart';
import 'package:weather_app/weather/data/repository/weather_repository.dart';
import 'package:weather_app/weather/domain/entities/weather_entities.dart';
import 'package:weather_app/weather/domain/repository/base_weather_repository.dart';
import 'weather/domain/use_case/get_weather_by_country_name.dart';

void main() async{
  BaseRemoteDataSource baseRemoteDataSource=RemoteDataSource();
  BaseWeatherRepository baseWeatherRepository=WeatherRepository(baseRemoteDataSource);
  WeatherEntities weather=await GetWeatherByCountryName(baseWeatherRepository).execute('Egypt');
  print(weather);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }


}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}


