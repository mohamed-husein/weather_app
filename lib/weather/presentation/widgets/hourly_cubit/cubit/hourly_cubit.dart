import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'hourly_state.dart';

class HourlyCubit extends Cubit<HourlyState> {
  HourlyCubit() : super(HourlyInitial());

  static HourlyCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  void changeIndex(index) {
    emit(HourlyInitial());
    currentIndex = index;
    emit(ChangeCurrentIndex());
  }
}
