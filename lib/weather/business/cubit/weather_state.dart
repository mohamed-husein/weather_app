part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

class GetLocationSuccessState extends WeatherState {
  final String position;

  const GetLocationSuccessState(this.position);
  @override
  List<Object?> get props => [position];
}

class GetLocationErrorState extends WeatherState {
  @override
  List<Object?> get props => [];
}

class GetWeahterDataSuccessState extends WeatherState {
  final WeatherDataModel data;

  const GetWeahterDataSuccessState(this.data);
  @override
  List<Object?> get props => [data];
}

class GetWeahterDataErrorState extends WeatherState {
  final String error;

  const GetWeahterDataErrorState(this.error);

  @override
  List<Object?> get props => [error];
}


