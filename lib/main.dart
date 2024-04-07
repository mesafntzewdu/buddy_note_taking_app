import 'package:buddy/screen/bottom_navigation.dart';
import 'package:buddy/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: lightTheme,
      duration: const Duration(microseconds: 600),
      builder: (_, theme) => MaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        home: const BottomNavigation(),
      ),
    );
  }
}
