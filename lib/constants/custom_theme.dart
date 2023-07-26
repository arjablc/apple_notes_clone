import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  final ThemeData customTheme = ThemeData(
    primarySwatch: Colors.yellow,
    scaffoldBackgroundColor: CupertinoColors.systemGroupedBackground,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 17),
        foregroundColor: CupertinoColors.systemYellow,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      ),
    ),
    iconTheme: const IconThemeData(color: CupertinoColors.systemYellow),
    textTheme: const TextTheme(
      titleSmall: TextStyle(color: CupertinoColors.inactiveGray, fontSize: 20),
      titleMedium: TextStyle(
          color: CupertinoColors.black,
          fontWeight: FontWeight.normal,
          fontSize: 20),
      titleLarge: TextStyle(
          color: CupertinoColors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20),
      displaySmall: TextStyle(
          color: CupertinoColors.black,
          fontWeight: FontWeight.w700,
          fontSize: 30),
    ),
  );
}
