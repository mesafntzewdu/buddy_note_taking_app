import 'package:flutter/material.dart';

class SideNavBar extends StatelessWidget {
  const SideNavBar({super.key});

  @override
  Widget build(context) {
    return NavigationDrawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      children: [
        DrawerHeader(
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Icon(
                Icons.calendar_month,
                size: 150,
              ),
              Positioned(
                left: 240,
                right: 5,
                top: 100,
                bottom: 5,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.sunny),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Info'),
            onTap: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Lock'),
            onTap: () {},
          ),
        )
      ],
    );
  }
}
