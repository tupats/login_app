import 'package:flutter/material.dart';
import '../colors.dart';

extension AppTextStyle on TextStyle {
  TextStyle get underline => copyWith(
        decoration: TextDecoration.underline,
        decorationColor: color,
        decorationThickness: 1,
      );

  TextStyle get darkOrange => copyWith(
        color: AppColors.darkOrange,
      );

  TextStyle get bold => copyWith(
        fontWeight: FontWeight.w900,
      );
}
