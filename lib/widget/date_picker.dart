import 'package:flutter/material.dart';

class DatePicker {
  BuildContext context;

  DatePicker(this.context);
  TimeOfDay? timeOfDay;

  DateTime? pickedDate;

  Future<DateTime?> datePicker() async {
    var fistDate = DateTime.now();
    var lastDate = fistDate.add(const Duration(days: 365));

    await showDatePicker(
      context: context,
      initialDate: fistDate,
      firstDate: fistDate,
      lastDate: lastDate,
    );

    return pickedDate;
  }

  Future<TimeOfDay?> timePicker() async {
    var initTime = TimeOfDay.now();

    await showTimePicker(
      context: context,
      initialTime: initTime,
    );

    return timeOfDay;
  }
}
