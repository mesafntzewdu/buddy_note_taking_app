import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
    void dataFunction() {
      print('date is called');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add new Task',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  'assets/animation.json',
                  width: double.infinity,
                  height: 300,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: 'Task Title',
                    label: Text(
                      'Task Title',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: 'Description',
                    label: Text(
                      'Description',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: 'End date',
                      label: Text(
                        'End date',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      prefixIcon: Icon(
                        Icons.calendar_month,
                        color: Theme.of(context).iconTheme.color,
                      )),
                  onTap: dataFunction,
                  readOnly: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    hintText: 'Reminder',
                    label: Text(
                      'Reminder',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    prefixIcon: Icon(
                      Icons.alarm,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  readOnly: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  label: Text(
                    'Add Task',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
