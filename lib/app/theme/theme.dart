import 'package:flutter/material.dart';

const seedColor = Color(0xFF6EEB83); // Example seed color

//ED820E
class AppTheme {
  static final light = ThemeData(
    fontFamily: 'Montserrat',
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xffF2F1F3),
      elevation: 0,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.light,
      primary: seedColor, // Primary color
      onPrimary: const Color(0xff1B1A1C), // Text color on primary background
      background: const Color(0xffF2F1F3), // Background color
      surface: const Color(0xffF2F1F3), // Surface color (like cards) // appbar
      onSurface: Colors.black, // Text color on surface
      error: Colors.red, // Error color
      onError: Colors.white, // Text color on error background
      primaryContainer: const Color(0xffF2F1F3), // Primary color container
      onPrimaryContainer:
          Colors.white, // Text color on primary container background
      secondary: Colors.green, // Secondary color
      onSecondary: Colors.white, // Text color on secondary background
      secondaryContainer: Colors.yellow, // Secondary color container
      onSecondaryContainer:
          Colors.white, // Text color on secondary container background
    ),
  );

  ///the dark theme data
  static final dark = ThemeData(
    fontFamily: 'Montserrat',
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.dark, // Adjust brightness to dark
      primary: seedColor, // Primary color
      onPrimary: Colors.white, // Text color on primary background
      background: const Color(0xff1B1A1C), // Background color
      surface: seedColor, // Surface color (like cards)
      onSurface: Colors.white, // Text color on surface
      error: Colors.red, // Error color
      onError: Colors.white, // Text color on error background
      primaryContainer: const Color(0xff1B1A1C), // Primary color container
      onPrimaryContainer:
          Colors.white, // Text color on primary container background
      secondary: Colors.blue, // Secondary color
      onSecondary: Colors.white, // Text color on secondary background
      secondaryContainer: Colors.blue, // Secondary color container
      onSecondaryContainer:
          Colors.white, // Text color on secondary container background
    ),
  );
}
