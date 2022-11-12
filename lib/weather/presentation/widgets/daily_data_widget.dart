import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/global/theme_color/theme_color_light.dart';
import '../../../core/utils/app_sizes.dart';
import '../../data/model/weather_data_model.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/images/custom_png_image.dart';

class DailyDataWidget extends StatelessWidget {
  const DailyDataWidget({super.key, required this.dataModel});

  final WeatherDataModel dataModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.pH15),
      child: Container(
        padding: EdgeInsets.all(AppSizes.pH15),
        decoration: BoxDecoration(
          color: ThemeColorLight.dividerLine.withAlpha(150),
          borderRadius: BorderRadius.circular(AppSizes.br20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText.bodyMedium(
              AppConstants.nextdays,
              context: context,
            ),
            SizedBox(
              height: AppSizes.pH10,
            ),
            DailyList(dataModel: dataModel),
          ],
        ),
      ),
    );
  }
}

class DailyList extends StatelessWidget {
  const DailyList({
    super.key,
    required this.dataModel,
  });
  final WeatherDataModel dataModel;

  String getTime(final day) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    String x = DateFormat('EEE').format(date);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.pH300,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText.labelSmall(
                getTime(dataModel.daily![index].dt),
                context: context,
                textStyle: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(fontSize: AppSizes.fs12),
              ),
              CustomPngImage(
                path: '$pngPath/${dataModel.daily![index].weather[0].icon}.png',
                width: AppSizes.pW40,
                height: AppSizes.pH40,
              ),
              CustomText.titleSmall(
                '${dataModel.daily![index].temp.max}°/${dataModel.daily![index].temp.min}',
                context: context,
                textStyle: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: AppSizes.fs12),
              ),
            ],
          );
        },
        itemCount: 7,
        separatorBuilder: (context, index) {
          return SizedBox(
            width: AppSizes.pW10,
          );
        },
      ),
    );
  }
}
