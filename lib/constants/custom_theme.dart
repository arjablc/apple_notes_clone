import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTheme {
  final ThemeData customLightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primaryContainer: CupertinoColors.systemGroupedBackground,
      onSecondaryContainer: CupertinoColors.white,
    ),
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
    iconTheme: const IconThemeData(color: Color(0xFFFFCC00)),
    textTheme: const TextTheme(
      titleSmall: TextStyle(color: CupertinoColors.inactiveGray, fontSize: 18),
      titleMedium: TextStyle(
          color: CupertinoColors.black,
          fontWeight: FontWeight.normal,
          fontSize: 18),
      titleLarge: TextStyle(
          color: CupertinoColors.black,
          fontWeight: FontWeight.w600,
          fontSize: 20),
      displaySmall: TextStyle(
          color: CupertinoColors.black,
          fontWeight: FontWeight.w700,
          fontSize: 30),
    ),
  );
  final ThemeData darkThemeData = ThemeData(
    colorScheme: const ColorScheme.dark(
        primaryContainer: CupertinoColors.black,
        onSecondaryContainer: CupertinoColors.darkBackgroundGray),
    appBarTheme: AppBarTheme(
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: Colors.black),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    primarySwatch: Colors.yellow,
    scaffoldBackgroundColor: CupertinoColors.black,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 17),
        foregroundColor: CupertinoColors.systemYellow,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      ),
    ),
    iconTheme: const IconThemeData(color: CupertinoColors.systemYellow),
    textTheme: const TextTheme(
      titleSmall: TextStyle(color: CupertinoColors.inactiveGray, fontSize: 18),
      titleMedium: TextStyle(
          color: CupertinoColors.white,
          fontWeight: FontWeight.normal,
          fontSize: 18),
      titleLarge: TextStyle(
          color: CupertinoColors.white,
          fontWeight: FontWeight.w600,
          fontSize: 20),
      displaySmall: TextStyle(
          color: CupertinoColors.white,
          fontWeight: FontWeight.w700,
          fontSize: 30),
    ),
  );
}
