import 'package:flutter/material.dart';
import 'package:login_app/utils/extensions/context.dart';

import 'colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  static TextStyle? underline(BuildContext context) =>
      context.textTheme.bodyMedium?.copyWith(
        color: AppColors.darkOrange,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.darkOrange,
        decorationThickness: 1,
        fontWeight: FontWeight.w900,
      );
}
