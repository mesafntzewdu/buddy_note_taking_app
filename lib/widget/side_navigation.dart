import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:buddy/screen/info.dart';
import 'package:buddy/screen/settings.dart';
import 'package:buddy/theme/theme.dart';
import 'package:buddy/widget/theme_button.dart';
import 'package:flutter/material.dart';

class SideNavBar extends StatelessWidget {
  const SideNavBar({super.key});

  @override
  Widget build(context) {
    return ThemeSwitchingArea(
      child: Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            const DrawerHeader(
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.calendar_month,
                    size: 140,
                  ),
                  PositionedButton(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
                title: Text('Settings',
                    style: Theme.of(context).textTheme.titleMedium),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const Settings();
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                leading: Icon(
                  Icons.info,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
                title: Text('Info',
                    style: Theme.of(context).textTheme.titleMedium),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const Info();
                      },
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: ListTile(
                leading: Icon(
                  Icons.lock,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
                title: Text('Lock',
                    style: Theme.of(context).textTheme.titleMedium),
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
