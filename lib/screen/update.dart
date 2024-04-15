import 'dart:math';

import 'package:buddy/helper/notification.dart';
import 'package:buddy/model/task.dart';
import 'package:buddy/screen/bottom_navigation.dart';
import 'package:buddy/service/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UpdateTask extends StatefulWidget {
  const UpdateTask({super.key, required this.data});

  final TaskModel data;

  @override
  State<UpdateTask> createState() {
    return UpdateTaskState();
  }
}

class UpdateTaskState extends State<UpdateTask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  TextEditingController endDateController = TextEditingController();
  TextEditingController alertController = TextEditingController();
  TimeOfDay? timeOfDay;
  DateTime? pickedDate;
  DateTime? scheduleDateTime;
  @override
  void initState() {
    super.initState();
    titleController.text = widget.data.title;
    descController.text = widget.data.description;
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update task',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const BottomNavigation()));
          },
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
                  maxLength: 20,
                  controller: titleController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
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
                  maxLength: 200,
                  controller: descController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
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
                  controller: endDateController,
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
                  onTap: datePicker,
                  readOnly: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: alertController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    hintText: 'Reminder at',
                    label: Text(
                      'Daily Reminder at',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    prefixIcon: Icon(
                      Icons.alarm,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  onTap: timePicker,
                  readOnly: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                OutlinedButton.icon(
                  onPressed: updateTaskAndNotify,
                  icon: Icon(
                    Icons.update,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  label: Text(
                    'Update Task',
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

  Future<void> datePicker() async {
    var fistDate = DateTime.now();
    var lastDate = fistDate.add(const Duration(days: 365));

    await showDatePicker(
      context: context,
      initialDate: fistDate,
      firstDate: fistDate,
      lastDate: lastDate,
    ).then(
      (value) => setState(() {
        endDateController.text = value.toString().substring(0, 11);
      }),
    );
  }

  Future<void> timePicker() async {
    var initTime = TimeOfDay.now();

    await showTimePicker(
      context: context,
      initialTime: initTime,
    ).then(
      (value) => setState(
        () {
          if (value != null) {
            alertController.text = value.format(context).toString();
            scheduleDateTime = DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
              value.hour,
              value.minute,
            );
          }
        },
      ),
    );
  }

  void updateTaskAndNotify() {
    if (titleController.text.trim().isEmpty) {
      snackBar('Title should not be empty');
      return;
    }

    if (endDateController.text.trim().isEmpty) {
      snackBar('End date should not be empty');
      return;
    }
    if (alertController.text.trim().isEmpty) {
      snackBar('Time should not be empty');
      return;
    }
    //add new task to db
    updateToDo();
    //add notification
    NotificationHelper.scheduleNotification(
      'Hey, am your Buddy.',
      'You set reminder for "${titleController.text.trim()}" check it out.',
      10,
      scheduleDateTime!,
      endDateController.text.trim(),
    );
    //show done message
    snackBar('Task updated');
  }

  void updateToDo() {
    DbHelper.update(TaskModel(
      id: widget.data.id,
      title: titleController.text.trim(),
      description: descController.text.trim(),
      endDate: endDateController.text.trim(),
      reminder: alertController.text.trim(),
      done: 'live',
    ));
  }

  void snackBar(String title) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        content: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
