import 'package:buddy/theme/theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightTheme;

  ThemeProvider(MaterialApp materialApp);

  ThemeData get themeData => _themeData;

  void toggleTheme() {
    if (_themeData == lightTheme) {
      themeSetter(darkTheme);
    } else {
      themeSetter(lightTheme);
    }
    notifyListeners();
  }

  void themeSetter(ThemeData themeData) {
    _themeData = themeData;
  }
}
