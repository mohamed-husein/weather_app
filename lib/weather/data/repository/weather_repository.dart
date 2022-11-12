import '../../../core/error/exceptions.dart';

import '../../../core/error/failure.dart';
import '../../../core/utils/import_files.dart';
import '../model/weather_data_model.dart';
import '../web_services/weather_web_services.dart';

class WeatherRepository {
  final WeatherWebServices webServices;

  WeatherRepository({required this.webServices});

  Future<Either<Failure, WeatherDataModel>> getWeatherData(
      double lat, double long) async {
    final result = await webServices.getWeatherData(lat, long);
    try {
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
