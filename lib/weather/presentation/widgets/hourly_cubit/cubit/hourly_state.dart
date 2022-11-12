part of 'hourly_cubit.dart';

abstract class HourlyState extends Equatable {
  const HourlyState();

  @override
  List<Object> get props => [];
}

class HourlyInitial extends HourlyState {}

class ChangeCurrentIndex extends HourlyState {
  }