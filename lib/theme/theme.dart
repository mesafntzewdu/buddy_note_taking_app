import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  colorSchemeSeed: Colors.grey[200],
  brightness: Brightness.light,
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 24, color: Colors.black),
    titleMedium: TextStyle(fontSize: 18, color: Colors.black),
    bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
    bodyMedium: TextStyle(fontSize: 14, color: Colors.black),
  ),
);

ThemeData darkTheme = ThemeData(
  colorSchemeSeed: Colors.grey[900],
  brightness: Brightness.dark,
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 24, color: Colors.white),
    titleMedium: TextStyle(fontSize: 18, color: Colors.white),
    bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
    bodyMedium: TextStyle(fontSize: 14, color: Colors.white),
  ),
);
