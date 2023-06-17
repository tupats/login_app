import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';

ThemeData get theme {
  final textTheme = _textTheme();

  return ThemeData(
    useMaterial3: true,
    primarySwatch: Colors.teal,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme(
      background: Colors.white,
      brightness: Brightness.light,
      error: Colors.red,
      onBackground: AppColors.gray,
      onError: Colors.white,
      onPrimary: AppColors.gray,
      onSecondary: AppColors.gray,
      onSurface: AppColors.gray,
      primary: AppColors.gray,
      secondary: Colors.teal,
      surface: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      foregroundColor: AppColors.blueishGray,
      elevation: 0,
      centerTitle: true,
      color: Colors.white,
      iconTheme: IconThemeData(
        color: AppColors.blueishGray,
      ),
      titleTextStyle: TextStyle(
        color: AppColors.blueishGray,
        fontSize: 18,
        fontWeight: FontWeight.w900,
      ),
      surfaceTintColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.teal,
        foregroundColor: Colors.white,
        side: BorderSide.none,
        shape: const LinearBorder(),
        minimumSize: const Size.fromHeight(60),
        textStyle: textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w900,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        side: BorderSide.none,
        shape: const LinearBorder(),
        textStyle: textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w900,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: TextButton.styleFrom(
        side: BorderSide(
          color: AppColors.whiteGray.withOpacity(0.49),
        ),
        shape: const RoundedRectangleBorder(),
        minimumSize: const Size.fromHeight(60),
        foregroundColor: AppColors.blueishGray,
        textStyle: textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w900,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: InputBorder.none,
      filled: true,
      fillColor: AppColors.nearWhite,
      contentPadding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
      labelStyle: textTheme.bodyMedium?.copyWith(
        color: AppColors.lightGray,
      ),
    ),
    textTheme: textTheme,
  );
}

TextTheme _textTheme() => TextTheme(
      titleLarge: GoogleFonts.ubuntu().copyWith(
        fontSize: 24,
        color: AppColors.blueishGray,
      ),
      bodyMedium: GoogleFonts.roboto().copyWith(
        fontSize: 16,
        color: AppColors.gray,
      ),
      labelMedium: GoogleFonts.roboto().copyWith(
        fontSize: 14,
        color: Colors.white.withOpacity(0.38),
      ),
    );
