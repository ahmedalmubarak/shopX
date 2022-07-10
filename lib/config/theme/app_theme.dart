import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopx/config/theme/app_colors.dart';

ThemeData lightThemeData() => ThemeData(
    primaryColor: AppColors.primary,
    primarySwatch: Colors.red,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.background,
    fontFamily: 'metro',
    useMaterial3: false,
    textTheme: const TextTheme(
      headline4: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      ),
      headline5: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
      subtitle1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
      subtitle2: TextStyle(
        fontSize: 16,
        color: AppColors.black,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: TextStyle(
        fontSize: 16,
        color: AppColors.black,
      ),
      bodyText2: TextStyle(
        fontSize: 14,
        color: AppColors.black,
        // fontWeight: FontWeight.w600,
      ),
      button: TextStyle(
        fontSize: 14,
        color: AppColors.black,
      ),
      caption: TextStyle(
        fontSize: 12,
        color: AppColors.black,
      ),
      overline: TextStyle(
        fontSize: 10,
        color: AppColors.black,
      ),
    ),
    appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0.0,
        color: Colors.transparent,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
        iconTheme: IconThemeData(
          color: AppColors.black,
        )),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shadowColor: AppColors.primary.withOpacity(0.5),
        primary: AppColors.primary,
        elevation: 5.0,
        onPrimary: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: AppColors.black,
        side: const BorderSide(color: AppColors.black),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: AppColors.grey),
      border: InputBorder.none,
      fillColor: AppColors.white,
      filled: true,
      hintStyle: TextStyle(
        color: AppColors.grey,
        fontSize: 16,
      ),
    ));
