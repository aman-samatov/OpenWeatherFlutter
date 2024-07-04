import 'package:flutter/material.dart';

import '../res/colors.dart';
import '../res/fonts.dart';
import '../res/sizes.dart';

class ErrorCard extends StatelessWidget {
  const ErrorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
          margin: EdgeInsets.symmetric(
              horizontal: AppSizes.errorCardHorizontalMargin,
              vertical: AppSizes.errorCardVerticalMargin),
          shadowColor: Colors.white70,
          color: AppColors.errorCardBackground,
          child: ListTile(
            leading: Icon(
              Icons.error_outlined,
              color: Colors.redAccent,
            ),
            title: Text(
              'Некорректное название города',
              style: TextStyle(
                  fontFamily: Fonts.kreadon,
                  fontSize: AppSizes.errorCardTitleFontSize,
                  color: Colors.white),
            ),
          )),
    );
  }
}
