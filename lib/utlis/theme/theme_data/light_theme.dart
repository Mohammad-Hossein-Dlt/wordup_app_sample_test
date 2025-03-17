import 'package:flutter/material.dart';
import 'package:wordup_flutter_test/constants/colors.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: bg,
  fontFamily: "Poppins",
  hintColor: textColor1,
  scaffoldBackgroundColor: bg,
  iconTheme: IconThemeData(color: mainColor),

  appBarTheme: AppBarTheme(
    backgroundColor: bg,
    surfaceTintColor: Colors.transparent,
    shadowColor: bg,
    elevation: 4,
  ),

  colorScheme: ColorScheme.dark(
    shadow: bg,
    primary: mainColor,
    primaryContainer: bg,
  ),

  textTheme: TextTheme(
    displayLarge: TextStyle(
      color: mainColor,
    ),
    displayMedium: TextStyle(
      color: mainColor,
    ),
    displaySmall: TextStyle(
      color: mainColor,
    ),
    headlineLarge: TextStyle(
      color: mainColor,
    ),
    headlineMedium: TextStyle(
      color: mainColor,
    ),
    headlineSmall: TextStyle(
      color: mainColor,
    ),
    titleLarge: TextStyle(
      color: textColor1,
    ),
    titleMedium: TextStyle(
      color: textColor1,
    ),
    titleSmall: TextStyle(
      color: mainColor,
    ),
    bodyLarge: TextStyle(
      color: mainColor,
    ),
    bodyMedium: TextStyle(
      color: mainColor,
    ),
    bodySmall: TextStyle(
      color: mainColor,
    ),
    labelLarge: TextStyle(
      color: mainColor,
    ),
    labelMedium: TextStyle(
      color: mainColor,
    ),
    labelSmall: TextStyle(
      color: mainColor,
    ),
  ),

  primaryTextTheme: TextTheme(
    displayLarge: TextStyle(
      color: mainColor,
    ),
    displayMedium: TextStyle(
      color: mainColor,
    ),
    displaySmall: TextStyle(
      color: mainColor,
    ),
    headlineLarge: TextStyle(
      color: mainColor,
    ),
    headlineMedium: TextStyle(
      color: mainColor,
    ),
    headlineSmall: TextStyle(
      color: mainColor,
    ),
    titleLarge: TextStyle(
      color: textColor1,
    ),
    titleMedium: TextStyle(
      color: textColor1,
    ),
    titleSmall: TextStyle(
      color: mainColor,
    ),
    bodyLarge: TextStyle(
      color: mainColor,
    ),
    bodyMedium: TextStyle(
      color: mainColor,
    ),
    bodySmall: TextStyle(
      color: mainColor,
    ),
    labelLarge: TextStyle(
      color: mainColor,
    ),
    labelMedium: TextStyle(
      color: mainColor,
    ),
    labelSmall: TextStyle(
      color: mainColor,
    ),
  ),

  // -------------------------------------------------------
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: mainColor,
      backgroundColor: mainColor,
      surfaceTintColor: Colors.transparent,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      surfaceTintColor: Colors.transparent,
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
    foregroundColor: mainColor,
  )),
);
