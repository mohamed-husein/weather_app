import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../business/cubit/weather_cubit.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../core/widgets/custom_text.dart';

class HeaderWidget extends StatelessWidget {
  HeaderWidget({super.key, required this.weatherCubit});
  final WeatherCubit weatherCubit;
  final date = DateFormat("yMMMMd").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText.displayLarge(
          weatherCubit.getCountryPosition(),
          context: context,
        ),
        SizedBox(
          height: AppSizes.pH8,
        ),
        CustomText.displaySmall(
          date,
          context: context,
        ),
      ],
    );
  }
}
