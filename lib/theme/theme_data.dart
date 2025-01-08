import 'package:flutter/material.dart';

class MyTheme {
  //* Light theme data
  static ThemeData lightTheme = ThemeData.light().copyWith(
    cardColor: const Color(0xFFFCFAFD),
    canvasColor: Colors.white,
    chipTheme: const ChipThemeData().copyWith(
      backgroundColor: const Color(0xFFFCFAFD),
      side: BorderSide.none,
    ),
  );

  //* Dark theme data
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color(0xFF161C2A),
    cardColor: const Color(0xFF1B2330),
    chipTheme: const ChipThemeData().copyWith(
      backgroundColor: const Color(0xFF1B2330),
      side: BorderSide.none,
    ),
    appBarTheme: const AppBarTheme().copyWith(backgroundColor: Colors.transparent),
    canvasColor: const Color(0xFF252a2f),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: const ButtonStyle().copyWith(
        backgroundColor: MaterialStateProperty.all(const Color(0xFF222A30)),
      ),
    ),
    buttonTheme: const ButtonThemeData().copyWith(
      buttonColor: Colors.pink,
    ),
  );
}
