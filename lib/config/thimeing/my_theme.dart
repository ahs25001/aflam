import 'package:aflame/core/utils/app_colors.dart';
import 'package:aflame/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData dark = ThemeData(
    iconTheme: const IconThemeData(color: Colors.white),
      scaffoldBackgroundColor: AppColors.appBackGround,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.barColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: AppColors.primary,
          onPrimary: AppColors.barColor,
          secondary: Colors.white,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.red,
          background: Colors.white38,
          onBackground: Colors.white38,
          surface: AppColors.cardColor,
          onSurface: Colors.white));
  static ThemeData light = ThemeData(
    iconTheme: const IconThemeData(
      color: Colors.black
    ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme:  const AppBarTheme(
        elevation: 4,
        // titleTextStyle: AppStyles.movieDetailsTitleStyle.copyWith(color: AppColors.appBackGround),
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.appBackGround),
      ),
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.blueAccent,//
          onPrimary: Colors.white,//
          secondary: Colors.white,//?
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.red,
          background: Colors.grey,//
          onBackground: Colors.black,
          surface: Colors.white70,//
          onSurface: Colors.black//
      ));
}
