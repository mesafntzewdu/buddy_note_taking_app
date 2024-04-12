import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:buddy/screen/add_task.dart';
import 'package:buddy/widget/task_list.dart';
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

        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const TaskList();
          },
        ),
        // body: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
        //   child: GlassContainer(
        //     border: Border.fromBorderSide(BorderSide.none),
        //     blur: 4,
        //     width: double.infinity,
        //     height: 200,
        //     color: Theme.of(context).colorScheme.tertiary.withOpacity(0.2),
        //     shadowColor: Colors.black.withOpacity(0.4),
        //     gradient: LinearGradient(
        //       colors: [
        //         Colors.grey.withOpacity(0.3),
        //         Colors.white.withOpacity(0.3),
        //         Colors.cyanAccent.withOpacity(0.3),
        //       ],
        //       begin: Alignment.topLeft,
        //       end: Alignment.bottomRight,
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
