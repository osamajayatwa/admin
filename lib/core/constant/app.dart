import 'package:admin_fujika_ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: "Roboto",
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor),
  appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.primaryColor,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColor.backgroundcolor),
      titleTextStyle: TextStyle(
          color: AppColor.backgroundcolor, fontFamily: 'Roboto', fontSize: 25)),
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    headlineLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
    bodyLarge: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.bold,
        fontSize: 14),
  ),
);
ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.primaryColor,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColor.backgroundcolor),
      titleTextStyle: TextStyle(
          color: AppColor.backgroundcolor, fontFamily: 'Cairo', fontSize: 25)),
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    headlineLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
    bodyLarge: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.bold,
        fontSize: 14),
  ),
);
