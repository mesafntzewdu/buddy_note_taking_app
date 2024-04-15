import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:buddy/model/task.dart';
import 'package:buddy/provider/delete_provider.dart';
import 'package:buddy/screen/update.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key, required this.data});

  final TaskModel data;

  @override
  Widget build(context) {
    return ThemeSwitchingArea(
      child: Consumer<DeleteProvider>(
        builder: (ctx, value, child) => Slidable(
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                flex: 1,
                onPressed: (_) {
                  value.deleteTask(data);
                },
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: const Color(0xFFFFFFFF),
                icon: Icons.delete,
                label: 'Delete',
                color: Colors.red,
              ),
              SlidableAction(
                onPressed: (_) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) {
                        return UpdateTask(data: data);
                      },
                    ),
                  );
                },
                backgroundColor: Theme.of(context).colorScheme.secondary,
                foregroundColor: const Color(0xFFFFFFFF),
                icon: Icons.edit,
                color: Colors.green,
                label: 'Edit',
              ),
              SlidableAction(
                onPressed: (_) {
                  value.doneTask(data);
                },
                backgroundColor:
                    Theme.of(context).colorScheme.onSecondaryContainer,
                foregroundColor: const Color(0xFFFFFFFF),
                icon: Icons.done,
                color: Colors.blue,
                label: 'Completed',
              ),
            ],
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                ),
                child: GlassContainer(
                  border: const Border.fromBorderSide(BorderSide.none),
                  blur: 4,
                  width: double.infinity,
                  height: 200,
                  color: Colors.grey.withOpacity(1),
                  shadowColor: Colors.black.withOpacity(0.3),
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey.withOpacity(0.3),
                      Colors.black.withOpacity(0.8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    data.title.toUpperCase(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 70,
                right: 20,
                bottom: 50,
                child: SingleChildScrollView(
                  child: Text(
                    data.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              Positioned(
                left: 20,
                bottom: 10,
                child: Row(
                  children: [
                    const Icon(
                      Icons.date_range,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      data.endDate,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 265,
                bottom: 10,
                child: Row(
                  children: [
                    Text(
                      data.reminder,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const Icon(
                      Icons.alarm,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
