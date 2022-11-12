import 'package:get_it/get_it.dart';
import '../../weather/data/repository/weather_repository.dart';
import '../../weather/data/web_services/weather_web_services.dart';
import '../../weather/business/cubit/weather_cubit.dart';

GetIt sl = GetIt.instance;

class ServiceLocator {
  static init() {
    /// Bloc
    sl.registerFactory(() => WeatherCubit(weatherRepository: sl()));

    /// Web Services
    sl.registerLazySingleton(() => WeatherWebServices());

    /// Repository
    sl.registerLazySingleton(() => WeatherRepository(webServices: sl()));
  }
}
