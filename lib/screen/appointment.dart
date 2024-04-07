import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';

class Appointment extends StatelessWidget {
  const Appointment({
    super.key,
  });

  @override
  Widget build(context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.onSecondary,
          onPressed: () {
            print('text');
          },
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ),
    );
  }
}
