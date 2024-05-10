import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (context, child) => Scaffold(
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
      ),
    );
  }
}
