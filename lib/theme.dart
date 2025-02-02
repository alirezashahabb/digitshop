import 'package:flutter/material.dart';

ThemeData lightThemeData() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    useMaterial3: false,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(fontSize: 14, fontFamily: 'Shabnam'),
      contentPadding: EdgeInsets.all(
        12,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(
          color: AppColor.mainTextColor,
          width: 0.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(
          color: AppColor.mainColor,
          width: 1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(
          color: AppColor.redColor,
          width: 0.5,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(
          color: AppColor.redColor,
          width: 1,
        ),
      ),
    ),
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
