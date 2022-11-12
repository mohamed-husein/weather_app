import 'package:dio/dio.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/utils/api_constants.dart';
import '../model/weather_data_model.dart';

class WeatherWebServices {
  Future< WeatherDataModel> getWeatherData(
      double lat, double long) async {
    final response = await Dio().get(ApiConstants.weatherApiPath(lat, long));

   
      if(response.statusCode == 200){
        return WeatherDataModel.fromJson(response.data);
   
    }
    else{
      throw ServerException();
    }
  }
}
