import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color(0xFF7CFC00),
      scaffoldBackgroundColor: const Color(0xFF121212),
      cardColor: const Color(0xFF232323),
      fontFamily: 'Montserrat',
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Color(0xFFB0B0B0)),
        titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: const Color(0xFF7CFC00),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF7CFC00),
        brightness: Brightness.dark,
      ),
    );
  }
} 