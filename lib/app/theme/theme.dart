
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const seedColor = Color(0xFF0C9869);
const String fontFamily = 'Montserrat';

class AppTheme {
  static final light = ThemeData(
    fontFamily: fontFamily,
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    textTheme: const TextTheme().copyWith(
        bodyMedium: const TextStyle(fontVariations: [FontVariation('wght', 600)]),
        bodySmall: const TextStyle(fontVariations: [FontVariation('wght', 600)])),
    appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarContrastEnforced: true,
            statusBarBrightness: Brightness.light,
            systemNavigationBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Colors.transparent,
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
        // color: Color(0xffF2F1F3),
        elevation: 0,
        surfaceTintColor: Color(0xffF2F1F3),
        titleTextStyle: TextStyle(
            color: Colors.black,
            fontVariations: [FontVariation('wght', 500)],
            fontSize: 16,
            fontFamily: fontFamily)),
    colorScheme: const ColorScheme.light(

      brightness: Brightness.light,
      primary: seedColor, // Primary color
      
    ),
  );

  }
