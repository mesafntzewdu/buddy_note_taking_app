import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:buddy/theme/theme.dart';
import 'package:flutter/material.dart';

class PositionedButton extends StatelessWidget {
  const PositionedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeSwitcher.withTheme(
      clipper: const ThemeSwitcherCircleClipper(),
      builder: (context, switcher, theme) => IconButton(
        onPressed: () {
          switcher.changeTheme(
            theme:
                theme.brightness == Brightness.light ? darkTheme : lightTheme,
            isReversed: true,
          );
        },
        icon: Icon(
          size: 30,
          theme.brightness == Brightness.light
              ? Icons.dark_mode
              : Icons.light_mode,
          color: theme.brightness == Brightness.light
              ? Colors.black
              : Colors.white,
        ),
      ),
    );
  }
}
