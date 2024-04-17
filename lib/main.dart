import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:buddy/helper/notification_controller.dart';
import 'package:buddy/helper/notification.dart';
import 'package:buddy/provider/delete_provider.dart';
import 'package:buddy/screen/bottom_navigation.dart';
import 'package:buddy/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationHelper.initNotification();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DeleteProvider(),
        ),
      ],
      child: ThemeProvider(
        initTheme: lightTheme,
        builder: (_, theme) => MaterialApp(
          theme: theme,
          debugShowCheckedModeBanner: false,
          home: const BottomNavigation(),
        ),
      ),
    );
  }
}
