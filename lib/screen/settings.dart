import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<StatefulWidget> createState() {
    return SettingsState();
  }
}

bool animateSet = false;
bool useSystemTheme = false;

class SettingsState extends State<Settings> {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: Text(
              'Don\'t animate',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            value: animateSet,
            onChanged: (val) {
              setState(
                () {
                  animateSet = val;
                },
              );
            },
          ),
          SwitchListTile(
            title: Text(
              'Use system theme',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            value: useSystemTheme,
            onChanged: (val) {
              setState(
                () {
                  useSystemTheme = val;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
