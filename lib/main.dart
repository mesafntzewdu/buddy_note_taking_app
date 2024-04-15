import 'package:buddy/helper/notification.dart';
import 'package:buddy/provider/delete_provider.dart';
import 'package:buddy/screen/bottom_navigation.dart';
import 'package:buddy/service/database_helper.dart';
import 'package:buddy/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationHelper.initAndIos();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        duration: const Duration(microseconds: 600),
        builder: (_, theme) => MaterialApp(
          color: Theme.of(context).colorScheme.background,
          theme: theme,
          debugShowCheckedModeBanner: false,
          home: const BottomNavigation(),
        ),
      ),
    );
  }
}
