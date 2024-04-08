import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:buddy/screen/add_task.dart';
import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  const Task({
    super.key,
  });
  @override
  Widget build(context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).iconTheme.color,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const AddTask();
            }));
          },
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.background,
          ),
        ),
      ),
    );
  }
}
