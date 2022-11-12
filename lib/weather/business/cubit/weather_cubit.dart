import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../../../core/utils/app_constants.dart';
import '../../data/repository/weather_repository.dart';

import '../../../core/error/failure.dart';
import '../../data/model/weather_data_model.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherCubit({required this.weatherRepository}) : super(WeatherInitial());

  static WeatherCubit get(context) => BlocProvider.of(context);

  String _position = '';
  WeatherDataModel _dataModel = const WeatherDataModel();

  WeatherDataModel getData() => _dataModel;
  String getCountryPosition() => _position;

  Future getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Future.error('Services is not Enabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);

    List<Placemark> currentLocationPosition =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    _position = currentLocationPosition[0].country!;

    final result = await weatherRepository.getWeatherData(
        position.latitude, position.longitude);
    result.fold((l) => emit(GetWeahterDataErrorState(_mapFailureToMsg(l))),
        (r) {
      _dataModel = r;
      emit(GetWeahterDataSuccessState(r));
    });
  }



  Future<void> getWeatherData() async {}

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppConstants.serverFailure;
      default:
        return 'Unexpected Error';
    }
  }
}
