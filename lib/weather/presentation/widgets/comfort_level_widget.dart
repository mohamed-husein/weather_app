import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../../../core/global/theme_color/theme_color_light.dart';
import '../../../core/utils/app_fonts.dart';
import '../../data/model/weather_data_model.dart';

import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../core/widgets/custom_text.dart';

class ComfortLevelWidget extends StatelessWidget {
  const ComfortLevelWidget({super.key, required this.dataModel});
  final WeatherDataModel dataModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText.bodyMedium(
          AppConstants.comfortLevel,
          context: context,
        ),
        SizedBox(
          height: AppSizes.pH10,
        ),
        SizedBox(
          height: AppSizes.pH180,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: dataModel.current!.humidity.toDouble(),
                  appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(
                      handlerSize: AppSizes.pW4,
                      trackWidth: AppSizes.pW12,
                    ),
                    infoProperties: InfoProperties(
                      bottomLabelText: AppConstants.humidity,
                      bottomLabelStyle:
                          Theme.of(context).textTheme.headlineMedium,
                    ),
                    animationEnabled: true,
                    size: AppSizes.pW153,
                    customColors: CustomSliderColors(
                      hideShadow: true,
                      trackColor:
                          ThemeColorLight.firstGradientColor.withAlpha(50),
                      progressBarColors: [
                        ThemeColorLight.firstGradientColor,
                        ThemeColorLight.secondGradientColor,
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${AppConstants.feelsLike} : ',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontWeight: AppFonts.semiBlod),
                        ),
                        TextSpan(
                          text: dataModel.current!.feelsLike.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(fontWeight: AppFonts.semiBlod),
                        )
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${AppConstants.uvi} : ',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontWeight: AppFonts.semiBlod),
                        ),
                        TextSpan(
                          text: dataModel.current!.uvi.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(fontWeight: AppFonts.semiBlod),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
