import 'package:buddy/screen/bottom_navigation.dart';
import 'package:buddy/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      theme: SystemTheme.lightTheme,
      darkTheme: SystemTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const BottomNavigation(),
    );
  }
}
