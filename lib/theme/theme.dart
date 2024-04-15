import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  colorSchemeSeed: Colors.grey[200],
  brightness: Brightness.light,
  textTheme: TextTheme(
    titleLarge: TextStyle(
        fontSize: 24,
        color: Colors.black,
        fontFamily: GoogleFonts.bitter().fontFamily),
    titleMedium: TextStyle(
        fontSize: 22,
        color: Colors.black,
        fontFamily: GoogleFonts.bitter().fontFamily),
    bodyLarge: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontFamily: GoogleFonts.bitter().fontFamily),
    bodyMedium: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontFamily: GoogleFonts.bitter().fontFamily),
  ),
  iconTheme: const IconThemeData(
    color: Colors.black,
    size: 20,
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusColor: Colors.black12,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Color.fromARGB(255, 34, 173, 180),
      ),
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  colorSchemeSeed: Colors.grey[900],
  brightness: Brightness.dark,
  textTheme: TextTheme(
    titleLarge: TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontFamily: GoogleFonts.bitter().fontFamily),
    titleMedium: TextStyle(
        fontSize: 22,
        color: Colors.white,
        fontFamily: GoogleFonts.bitter().fontFamily),
    bodyLarge: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontFamily: GoogleFonts.bitter().fontFamily),
    bodyMedium: TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontFamily: GoogleFonts.bitter().fontFamily),
  ),
  iconTheme: const IconThemeData(
    color: Color.fromARGB(100, 0, 255, 255),
    size: 20,
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusColor: const Color.fromARGB(100, 0, 255, 255),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Color.fromARGB(100, 0, 255, 255),
      ),
    ),
  ),
);
