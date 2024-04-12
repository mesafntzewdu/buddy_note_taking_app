import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
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
        Positioned(
          top: 20,
          left: 110,
          bottom: 150,
          right: 20,
          child: Text(
            'HI HIS IS Title',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Positioned(
          left: 20,
          top: 70,
          right: 20,
          bottom: 50,
          child: SingleChildScrollView(
            child: Text(
              'hi this is some description, about the title and, title length must be with in some rage',
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
                '2024/12/12',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        Positioned(
          left: 250,
          bottom: 10,
          child: Row(
            children: [
              Text(
                '2024/12/12',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                width: 4,
              ),
              Icon(
                Icons.alarm,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
