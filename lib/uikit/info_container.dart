import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_weather/res/colors.dart';
import 'package:open_weather/res/fonts.dart';
import 'package:open_weather/res/sizes.dart';

class InfoContainer extends StatelessWidget {
  final String title;
  final String value;
  final Color bottomGradientColor;
  final Color borderColor;
  final String picturePath;
  final Color pictureColor;
  final double? horizontalMargin;
  final double verticalMargin;

  const InfoContainer(
      {super.key,
      required this.title,
      required this.value,
      required this.bottomGradientColor,
      required this.borderColor,
      required this.picturePath,
      required this.pictureColor,
      this.verticalMargin = AppSizes.infoContainerDefaultVerticalMargin,
      this.horizontalMargin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.infoContainerWidth,
      height: AppSizes.infoContainerHeight,
      margin: EdgeInsets.symmetric(
          horizontal:
              horizontalMargin ?? AppSizes.infoContainerHorizontalMargin,
          vertical: verticalMargin),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              bottomGradientColor,
              AppColors.infoContainerTopGradientColor
            ]),
        border: Border.all(
          color: borderColor,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSizes.infoContainerBorderRadius),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            picturePath,
            colorFilter: ColorFilter.mode(pictureColor, BlendMode.srcIn),
            width: AppSizes.infoContainerImageSize,
            height: AppSizes.infoContainerImageSize,
          ),
          Text(
            title,
            style: const TextStyle(
                fontFamily: Fonts.kreadon,
                fontSize: AppSizes.infoContainerTitleFontSize,
                color: Colors.white),
          ),
          Text(
            value,
            style: const TextStyle(
                fontFamily: Fonts.kreadon,
                fontSize: AppSizes.infoContainerValueFontSize,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
