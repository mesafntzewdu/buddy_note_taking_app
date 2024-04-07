import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:buddy/theme/theme.dart';
import 'package:flutter/material.dart';

class PositionedButton extends StatelessWidget {
  const PositionedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 235,
      right: 5,
      top: 100,
      bottom: 5,
      child: ThemeSwitcher.withTheme(
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
            theme.brightness == Brightness.light
                ? Icons.dark_mode
                : Icons.light_mode,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        ),
      ),
    );
  }
}
