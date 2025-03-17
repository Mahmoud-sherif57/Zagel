import 'package:flutter/material.dart';
import 'package:zagel/core/utils/colors.dart';
import 'package:zagel/core/utils/text_style.dart';

ThemeData appDarkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.black,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.black,
    foregroundColor: AppColors.primary,
    centerTitle: true,
    titleTextStyle: getSmallStyle(color: AppColors.white),
    // titleTextStyle: getBodyStyle(context,color: AppColors.white),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.grey,
    showSelectedLabels: true,
    showUnselectedLabels: false,
  ),
  // colorScheme is used to save your colors .
  colorScheme: ColorScheme.fromSeed(
      primary: AppColors.primary,
      surface: AppColors.black,
      onSurface: AppColors.white, //for text
      seedColor: AppColors.primary,
      error: AppColors.red),
  datePickerTheme: const DatePickerThemeData(backgroundColor: AppColors.black),
  timePickerTheme: const TimePickerThemeData(
    backgroundColor: AppColors.black,
    dialBackgroundColor: AppColors.black,
  ),

  // fontFamily: GoogleFonts.poppins().fontFamily,
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: getSmallStyle(color: AppColors.white),
    suffixIconColor: AppColors.primary,
    prefixIconColor: AppColors.primary,
    // constraints: const BoxConstraints(maxHeight: 60),
    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.primary),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.primary),
      borderRadius: BorderRadius.circular(10),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.red),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.red),
      borderRadius: BorderRadius.circular(10),
    ),
  ),
);
