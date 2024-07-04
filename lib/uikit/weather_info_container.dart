import 'package:flutter/material.dart';
import 'package:open_weather/res/colors.dart';
import 'package:open_weather/res/sizes.dart';

import '../res/fonts.dart';

class WeatherInfoContainer extends StatelessWidget {
  final String cityName;
  final String temperature;
  final String weatherStateIcon;
  final String date;
  final String description;

  const WeatherInfoContainer({
    super.key,
    required this.cityName,
    required this.temperature,
    required this.weatherStateIcon,
    required this.date,
    required this.description,
  });

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(
            left: AppSizes.weatherInfoContainerMarginVertical,
            right: AppSizes.weatherInfoContainerMarginVertical,
            top: AppSizes.weatherInfoContainerMarginTop,
            bottom: AppSizes.weatherInfoContainerMarginBottom),
        decoration: const BoxDecoration(
          color: AppColors.weatherInfoContainerBackground,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              top: AppSizes.weatherInfoContainerPaddingTop,
              bottom: AppSizes.weatherInfoContainerPaddingBottom,
              left: AppSizes.weatherInfoContainerPaddingVertical,
              right: AppSizes.weatherInfoContainerPaddingVertical),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                        height: AppSizes.weatherInfoContainerSizedBoxHeight),
                    Text(
                      cityName,
                      style: const TextStyle(
                          fontFamily: Fonts.kreadon,
                          fontSize:
                              AppSizes.weatherInfoContainerCityNameFontSize,
                          color: Colors.white),
                    ),
                    Text(
                      date,
                      style: const TextStyle(
                          fontFamily: Fonts.kreadon,
                          fontSize: AppSizes.weatherInfoContainerDateFontSize,
                          color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: AppSizes
                              .weatherInfoContainerTemperaturePaddingTop),
                      child: Text(
                        temperature,
                        style: const TextStyle(
                            fontFamily: Fonts.kreadon,
                            fontSize: AppSizes
                                .weatherInfoContainerTemperatureFontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Image.asset(
                    weatherStateIcon,
                    width: AppSizes.weatherInfoContainerImageSize,
                    height: AppSizes.weatherInfoContainerImageSize,
                  ),
                  SizedBox(
                    width: AppSizes.weatherInfoDescriptionWidth,
                    child: Center(
                      child: Text(
                        description,
                        softWrap: true,
                        style: const TextStyle(
                            fontFamily: Fonts.kreadon,
                            fontSize: AppSizes.weatherInfoDescriptionFontSize,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
