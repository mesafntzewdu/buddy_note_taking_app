import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:buddy/screen/info.dart';
import 'package:buddy/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SideNavBar extends StatelessWidget {
  const SideNavBar({super.key});

  @override
  Widget build(context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (context, child) => ThemeSwitchingArea(
        child: Drawer(
          backgroundColor: Theme.of(context).colorScheme.background,
          child: Column(
            children: [
              DrawerHeader(
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.calendar_month,
                      size: 140.dm,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Theme.of(context).iconTheme.color,
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
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: ListTile(
                  leading: Icon(
                    Icons.info,
                    color: Theme.of(context).iconTheme.color,
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
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: const Text('Version 1.0.0'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
