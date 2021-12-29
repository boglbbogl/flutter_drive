import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
      fontFamily: 'NotoSansKR',
      backgroundColor: darkThemeMainColor,
      primaryColor: appSubColor,
      canvasColor: darkThemeMainColor,
      primarySwatch: materialWhiteColor,
      inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(
              color: Color.fromRGBO(175, 175, 175, 1), fontSize: 9),
          hintStyle: const TextStyle(
              color: Color.fromRGBO(175, 175, 175, 1), fontSize: 8),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: darkThemeMainColor),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: darkThemeMainColor),
          )),
      textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.white, fontSize: 14)),
      dividerTheme:
          const DividerThemeData(color: Color.fromRGBO(115, 115, 115, 1)),
      appBarTheme: AppBarTheme(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: darkThemeMainColor,
        actionsIconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
            // fontFamily: 'DoHyeon',
            color: materialWhiteColor,
            fontSize: 25,
            fontWeight: FontWeight.bold),
      ));
}
