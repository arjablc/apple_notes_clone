import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTheme {
  final ThemeData customTheme = ThemeData(
    appBarTheme: AppBarTheme(
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: Colors.black),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
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
