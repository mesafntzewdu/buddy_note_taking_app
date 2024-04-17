import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationHelper {
  static Future<void> initNotification() async {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'buddy',
          channelName: 'buddy_notification',
          channelDescription: 'Buddy notification',
          playSound: true,
          onlyAlertOnce: true,
          defaultPrivacy: NotificationPrivacy.Private,
          importance: NotificationImportance.High,
        )
      ],
      debug: true,
    );
  }

  static void setNotification(
      {id, title, body, TimeOfDay? alertTime, DateTime? endDate}) {
    Duration dayLeft = endDate!.difference(DateTime.now());
    int day = int.parse(dayLeft.inDays.toString());
    for (int x = 0; x <= day + 1; x++) {
      AwesomeNotifications().createNotification(
        schedule: NotificationCalendar(
          repeats: false,
          year: DateTime.now().year,
          month: DateTime.now().month,
          day: DateTime.now().day + x,
          hour: alertTime!.hour,
          minute: alertTime.minute,
        ),
        content: NotificationContent(
          id: Random().nextInt(1000) + 100,
          channelKey: 'buddy',
          title: title,
          body: body,
        ),
      );
    }
  }
}
