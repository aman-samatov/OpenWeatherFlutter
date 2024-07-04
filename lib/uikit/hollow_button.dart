import 'package:flutter/material.dart';
import 'package:open_weather/res/sizes.dart';

import '../res/fonts.dart';

class HollowButton extends StatelessWidget {
  final String buttonTitle;
  final MaterialStateProperty<Color> shadowColor;
  final MaterialStateProperty<Color> backgroundColor;
  final Color borderColor;
  final void Function() onPressed;

  const HollowButton(
      {super.key,
      required this.buttonTitle,
      required this.onPressed,
      this.shadowColor = const MaterialStatePropertyAll(Colors.blueGrey),
      this.backgroundColor = const MaterialStatePropertyAll(Colors.black26),
      this.borderColor = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(AppSizes.hollowButtonWidth),
        shadowColor: shadowColor,
        side: MaterialStatePropertyAll(
            BorderSide(color: borderColor, width: AppSizes.hollowButtonWidth)),
        backgroundColor: backgroundColor,
        shape: const MaterialStatePropertyAll(StadiumBorder()),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(
              horizontal: AppSizes.hollowButtonHorizontalPadding,
              vertical: AppSizes.hollowButtonVerticalPadding),
        ),
      ),
      child: Text(
        buttonTitle,
        style: const TextStyle(
            fontFamily: Fonts.kreadon,
            fontSize: AppSizes.hollowButtonTitleFontSize,
            color: Colors.white),
      ),
    );
  }
}
