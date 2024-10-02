import 'package:flutter/material.dart';

import 'app_colors.dart';

class MyAppTheme {
  static final ThemeData lightTheme = ThemeData(
      //canvasColor: AppColors.primaryLightColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.primaryLightColor,
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent, elevation: 0, centerTitle: true),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: AppColors.blackColor,
      )));
}
