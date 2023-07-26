import 'package:flutter/material.dart';

class CustomColors {
  static const Color textButtonColor = Color(0xffe3b830);
  static const Color subTextColor = Color(0xff8a8a8d);
  static const Color whiteBakcground = Color(0xfff2f2f7);
}

class CustomTheme {
  final ThemeData customTheme = ThemeData(
    scaffoldBackgroundColor: CustomColors.whiteBakcground,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 15),
        foregroundColor: CustomColors.textButtonColor,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      ),
    ),
    iconTheme: const IconThemeData(color: CustomColors.textButtonColor),
    textTheme: const TextTheme(
      titleSmall: TextStyle(
          color: Colors.black, fontWeight: FontWeight.normal, fontSize: 20),
      titleMedium: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      titleLarge: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w700, fontSize: 30),
    ),
  );
}
