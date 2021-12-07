import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
      fontFamily: 'NotoSansKR',
      backgroundColor: darkThemeMainColor,
      primaryColor: appSubColor,
      canvasColor: darkThemeMainColor,
      primarySwatch: materialWhiteColor,
      textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.white, fontSize: 18)),
      appBarTheme: AppBarTheme(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: darkThemeMainColor,
        actionsIconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
            color: materialWhiteColor,
            fontSize: 25,
            fontWeight: FontWeight.bold),
      ));
}
