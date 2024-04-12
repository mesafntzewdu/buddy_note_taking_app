import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationHelper {
  static final FlutterLocalNotificationsPlugin _notification =
      FlutterLocalNotificationsPlugin();
  //static final _notification = FlutterLocalNotificationsPlugin();
  static initAndIos() {
    _notification.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(
          requestSoundPermission: true,
          requestAlertPermission: true,
          defaultPresentAlert: true,
          defaultPresentBadge: true,
          defaultPresentBanner: true,
        ),
      ),
    );
    tz.initializeTimeZones();
  }

  static scheduleNotification(
    String title,
    String body,
    int id,
    DateTime alertTimeSet,
    String endDate,
  ) async {
    TZDateTime alertTime = tz.TZDateTime.from(alertTimeSet, tz.local);
    var iOSDetail = const DarwinNotificationDetails();
    var androidNotificationDetail = const AndroidNotificationDetails(
      'important_notification',
      'My Channel',
      importance: Importance.max,
      priority: Priority.high,
    );
    var notificationDetails =
        NotificationDetails(android: androidNotificationDetail, iOS: iOSDetail);
    final cDate = DateTime.now();
    final uDate = DateTime.parse(endDate).difference(cDate);

    int dayLong = (uDate.inDays + 1);

    for (int x = 1; x <= dayLong; x++) {
      await _notification.zonedSchedule(
        x,
        title,
        body,
        alertTime.add(Duration(days: x)),
        notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
      );
    }
  }
}
