import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../core/global/theme_color/theme_color_light.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/images/custom_png_image.dart';
import '../../data/model/weather_data_model.dart';
import 'hourly_cubit/cubit/hourly_cubit.dart';

class HourlyDataWidget extends StatelessWidget {
  final WeatherDataModel dataModel;
  const HourlyDataWidget({
    super.key,
    required this.dataModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppSizes.pH15,
        ),
        CustomText.bodyMedium(
          AppConstants.today,
          context: context,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: AppSizes.pH10,
        ),
        hourlyList(dataModel),
      ],
    );
  }

  Widget hourlyList(WeatherDataModel dataModel) {
    return SizedBox(
      height: 150,
      child: BlocProvider(
        create: (context) => HourlyCubit(),
        child: BlocBuilder<HourlyCubit, HourlyState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            HourlyCubit weatherCubit = HourlyCubit.get(context);
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    weatherCubit.changeIndex(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSizes.br10),
                      color: weatherCubit.currentIndex == index
                          ? ThemeColorLight.firstGradientColor
                          : ThemeColorLight.cardColor,
                    ),
                    child: HourlyDetails(
                      temp: dataModel.hourly![index].temp,
                      timeStamp: dataModel.hourly![index].dt,
                      weatherIcon: dataModel.hourly![index].weather[0].icon,
                      index: index,
                      currentIndex: weatherCubit.currentIndex,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                width: AppSizes.pW10,
              ),
              itemCount:
                  dataModel.hourly!.length > 12 ? 12 : dataModel.hourly!.length,
            );
          },
        ),
      ),
    );
  }
}

class HourlyDetails extends StatelessWidget {
  const HourlyDetails({
    super.key,
    required this.temp,
    required this.timeStamp,
    required this.weatherIcon,
    required this.index,
    required this.currentIndex,
  });
  final int temp;
  final int timeStamp;
  final int index;
  final int currentIndex;
  final String weatherIcon;

  String getTime(final day) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    String x = DateFormat('jm').format(date);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.pW18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomText.labelSmall(
            getTime(timeStamp),
            context: context,
            textStyle: currentIndex == index
                ? Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: ThemeColorLight.white,
                    )
                : null,
          ),
          CustomPngImage(
            path: '$pngPath/$weatherIcon.png',
            width: AppSizes.pW40,
            height: AppSizes.pH40,
          ),
          CustomText.titleSmall(
            '$temp°',
            context: context,
            textStyle: currentIndex == index
                ? Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: ThemeColorLight.white,
                    )
                : null,
          ),
        ],
      ),
    );
  }
}
