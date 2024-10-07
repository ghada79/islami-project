import 'package:flutter/material.dart';

import 'app_colors.dart';

class MyAppTheme {
  static final ThemeData lightTheme = ThemeData(
      //canvasColor: AppColors.primaryLightColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.primaryLightColor,
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: AppColors.blackColor,
          )),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: AppColors.blackColor,
          ),
          bodyMedium: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 25,
            color: AppColors.blackColor,
          ),
          bodySmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: AppColors.blackColor,
          ),
          titleLarge: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 22,
            color: AppColors.blackColor,
          )));
}
