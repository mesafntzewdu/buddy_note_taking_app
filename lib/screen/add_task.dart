import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() {
    return AddTaskState();
  }
}

class AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add new Task',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
