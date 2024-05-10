import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:buddy/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PositionedButton extends StatelessWidget {
  const PositionedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (context, child) => ThemeSwitcher.withTheme(
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
            size: 30.dm,
            theme.brightness == Brightness.light
                ? Icons.dark_mode
                : Icons.light_mode,
            color: theme.brightness == Brightness.light
                ? Colors.black
                : Colors.white,
          ),
        ),
      ),
    );
  }
}
