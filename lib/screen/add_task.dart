import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:buddy/helper/notification.dart';
import 'package:buddy/model/task.dart';
import 'package:buddy/screen/bottom_navigation.dart';
import 'package:buddy/service/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() {
    return AddTaskState();
  }
}

class AddTaskState extends State<AddTask> {
  DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  TextEditingController endDateController = TextEditingController();
  TextEditingController alertController = TextEditingController();
  TimeOfDay? timeOfDay;
  DateTime? pickedDate;
  TimeOfDay? timePicked;

  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((value) {
      if (!value) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Add new Task',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => BottomNavigation()));
            },
          ),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                    'assets/animation.json',
                    width: double.infinity,
                    height: 300.h,
                  ),
                  TextField(
                    maxLength: 20,
                    controller: titleController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
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
                    maxLength: 100,
                    controller: descController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        ),
                      ),
                      hintText: 'Description',
                      label: Text(
                        'Description',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextField(
                    controller: endDateController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r))),
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
                  SizedBox(
                    height: 10.h,
                  ),
                  TextField(
                    controller: alertController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
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
                  SizedBox(
                    height: 15.h,
                  ),
                  OutlinedButton.icon(
                    onPressed: addTaskAndNotify,
                    icon: Icon(
                      Icons.add,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    label: Text(
                      'Add Task',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
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
        endDateController.text = dateFormat.format(value!);
        //value.toString().substring(0, 11);
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
            timePicked = value;
          }
        },
      ),
    );
  }

  void addTaskAndNotify() {
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
    addToDb();
    //add notification
    NotificationHelper.setNotification(
      id: Random().nextInt(10000) + 500,
      title: 'Hey, am your Buddy.',
      body:
          'You set reminder for "${titleController.text.trim()}" check it out.',
      alertTime: timePicked,
      endDate: DateTime.parse(endDateController.text.trim()),
    );

    //show done message
    snackBar('New task added');
    clearWindow();
  }

  void addToDb() {
    DbHelper.insert(
      TaskModel(
        id: Random().nextInt(10),
        title: titleController.text.trim(),
        description: descController.text.trim(),
        endDate: endDateController.text.trim(),
        reminder: alertController.text.trim(),
        done: 'live',
      ),
    );
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

  void clearWindow() {
    titleController.clear();
    descController.clear();
    endDateController.clear();
    alertController.clear();
  }
}
