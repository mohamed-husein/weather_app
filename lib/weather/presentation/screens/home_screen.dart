import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/global/theme_color/theme_color_light.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/utils/app_sizes.dart';
import '../../business/cubit/weather_cubit.dart';
import '../widgets/comfort_level_widget.dart';
import '../widgets/current_weather_widget.dart';
import '../widgets/daily_data_widget.dart';
import '../widgets/header_widget.dart';
import '../widgets/hourly_data_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: AppSizes.pW20,
        right: AppSizes.pW20,
        top: AppSizes.pH32,
      ),
      color: ThemeColorLight.white,
      child: SafeArea(
        child: BlocProvider<WeatherCubit>(
          create: (context) => sl<WeatherCubit>()..getLocation(),
          child: Scaffold(
            body: BlocBuilder<WeatherCubit, WeatherState>(
              builder: (context, state) {
                WeatherCubit weatherCubit = WeatherCubit.get(context);
                if (state is GetWeahterDataSuccessState) {
                  return ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      HeaderWidget(weatherCubit: weatherCubit),
                      CurrentWeatherWidget(dataModel: state.data),
                      HourlyDataWidget(dataModel: state.data),
                      DailyDataWidget(dataModel: state.data),
                      ComfortLevelWidget(dataModel: state.data),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
