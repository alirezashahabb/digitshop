import 'package:flutter/material.dart';

ThemeData lightThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: AppColor.scaffoldColor,
    textTheme: TextTheme(
        bodySmall: TextStyle(
          fontFamily: 'Shabnam',
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Shabnam',
        ),
        titleLarge: TextStyle(
          fontFamily: 'Shabnam',
        ),
        titleSmall: TextStyle(
          fontFamily: 'Shabnam',
        )),
  );
}

class AppColor {
  static const mainColor = Color(0xff3B5EDF);
  static const secondaryColor = Color(0xff858585);
  static const redColor = Color(0xffD02026);
  static const greenColor = Color(0xff1DB68B);
  static const mainTextColor = Color(0xff000000);
  static const scaffoldColor = Color(0xffEEEEEE);
  static const whiteColor = Colors.white;
}
