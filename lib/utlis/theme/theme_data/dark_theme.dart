import 'package:flutter/material.dart';
import 'package:wordup_flutter_test/constants/colors.dart';

ThemeData darkTheme = ThemeData(
  primaryColor: dBg,
  fontFamily: "Poppins",
  hintColor: textColor1,
  scaffoldBackgroundColor: dBg,
  iconTheme: IconThemeData(color: dMainColor),

  appBarTheme: AppBarTheme(
    backgroundColor: dBg,
    surfaceTintColor: Colors.transparent,
    shadowColor: dBg,
    elevation: 4,
  ),

  colorScheme: ColorScheme.dark(
    shadow: dBg,
    primary: dMainColor,
    primaryContainer: dBg,
  ),

  textTheme: TextTheme(
    displayLarge: TextStyle(
      color: dTextMain,
    ),
    displayMedium: TextStyle(
      color: dTextMain,
    ),
    displaySmall: TextStyle(
      color: dTextMain,
    ),
    headlineLarge: TextStyle(
      color: dTextMain,
    ),
    headlineMedium: TextStyle(
      color: dTextMain,
    ),
    headlineSmall: TextStyle(
      color: dTextMain,
    ),
    titleLarge: TextStyle(
      color: dTextColor1,
    ),
    titleMedium: TextStyle(
      color: dTextColor1,
    ),
    titleSmall: TextStyle(
      color: dTextMain,
    ),
    bodyLarge: TextStyle(
      color: dTextMain,
    ),
    bodyMedium: TextStyle(
      color: dTextMain,
    ),
    bodySmall: TextStyle(
      color: dTextMain,
    ),
    labelLarge: TextStyle(
      color: dTextMain,
    ),
    labelMedium: TextStyle(
      color: dTextMain,
    ),
    labelSmall: TextStyle(
      color: dTextMain,
    ),
  ),

  primaryTextTheme: TextTheme(
    displayLarge: TextStyle(
      color: dTextMain,
    ),
    displayMedium: TextStyle(
      color: dTextMain,
    ),
    displaySmall: TextStyle(
      color: dTextMain,
    ),
    headlineLarge: TextStyle(
      color: dTextMain,
    ),
    headlineMedium: TextStyle(
      color: dTextMain,
    ),
    headlineSmall: TextStyle(
      color: dTextMain,
    ),
    titleLarge: TextStyle(
      color: textColor1,
    ),
    titleMedium: TextStyle(
      color: textColor1,
    ),
    titleSmall: TextStyle(
      color: dTextMain,
    ),
    bodyLarge: TextStyle(
      color: dTextMain,
    ),
    bodyMedium: TextStyle(
      color: dTextMain,
    ),
    bodySmall: TextStyle(
      color: dTextMain,
    ),
    labelLarge: TextStyle(
      color: dTextMain,
    ),
    labelMedium: TextStyle(
      color: dTextMain,
    ),
    labelSmall: TextStyle(
      color: dTextMain,
    ),
  ),

  // -------------------------------------------------------
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: dMainColor,
      backgroundColor: dMainColor,
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
    foregroundColor: dMainColor,
  )),
);
