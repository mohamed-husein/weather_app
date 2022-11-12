import 'package:flutter/material.dart';
import '../../../core/global/theme_color/theme_color_light.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/images/custom_png_image.dart';
import '../../data/model/weather_data_model.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({super.key, required this.dataModel});
  final WeatherDataModel dataModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: AppSizes.pH15,
        ),
        temperatureAreaWidget(
          context: context,
          image: dataModel.current!.weather[0].icon,
          temp: dataModel.current!.temp,
          description: dataModel.current!.weather[0].description,
        ),
        SizedBox(
          height: AppSizes.pH15,
        ),
        currentWeatherMoreDetailsWidget(
          context: context,
          clouds: dataModel.current!.clouds.toString(),
          humidity: dataModel.current!.humidity.toString(),
          windspeed: dataModel.current!.windSpeed.toString(),
        ),
      ],
    );
  }

  Widget temperatureAreaWidget(
      {required String image,
      required int temp,
      required BuildContext context,
      required String description}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomPngImage.square(
          path: '$pngPath/$image.png',
          height: AppSizes.pH80,
          width: AppSizes.pW80,
        ),
        Container(
          height: AppSizes.pH60,
          width: AppSizes.pW2,
          color: ThemeColorLight.dividerLine,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: '$temp°',
                  style: Theme.of(context).textTheme.headlineLarge),
              TextSpan(
                  text: description,
                  style: Theme.of(context).textTheme.headlineSmall)
            ],
          ),
        ),
      ],
    );
  }

  Widget currentWeatherMoreDetailsWidget({
    required BuildContext context,
    required String clouds,
    required String humidity,
    required String windspeed,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: AppSizes.pW60,
              height: AppSizes.pH60,
              decoration: BoxDecoration(
                color: ThemeColorLight.cardColor,
                borderRadius: BorderRadius.circular(AppSizes.br15),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: AppSizes.pH12, horizontal: AppSizes.pW12),
                child: const CustomPngImage(
                  path: AppAssets.clouds,
                ),
              ),
            ),
            Container(
              width: AppSizes.pW60,
              height: AppSizes.pH60,
              decoration: BoxDecoration(
                color: ThemeColorLight.cardColor,
                borderRadius: BorderRadius.circular(AppSizes.br15),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: AppSizes.pH12, horizontal: AppSizes.pW12),
                child: const CustomPngImage(
                  path: AppAssets.humidity,
                ),
              ),
            ),
            Container(
              width: AppSizes.pW60,
              height: AppSizes.pH60,
              decoration: BoxDecoration(
                color: ThemeColorLight.cardColor,
                borderRadius: BorderRadius.circular(AppSizes.br15),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: AppSizes.pH12, horizontal: AppSizes.pW12),
                child: const CustomPngImage(
                  path: AppAssets.windspeed,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: AppSizes.pH10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.pW6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText.bodySmall('$clouds KM/H', context: context),
              Padding(
                padding: EdgeInsets.only(right: AppSizes.pW8),
                child: CustomText.bodySmall('$humidity %', context: context),
              ),
              CustomText.bodySmall('$windspeed %', context: context),
            ],
          ),
        ),
      ],
    );
  }
}
