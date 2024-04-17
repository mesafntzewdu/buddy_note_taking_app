import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:buddy/screen/history.dart';
import 'package:buddy/screen/task.dart';
import 'package:buddy/widget/side_navigation.dart';
import 'package:buddy/widget/theme_button.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() {
    return BottomNavigationState();
  }
}

class BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;

  @override
  Widget build(context) {
    var title = 'Tasks';
    Widget content = Task();

    if (selectedIndex == 1) {
      title = 'History';
      content = History();
    }
    return ThemeSwitchingArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        drawer: const SideNavBar(),
        appBar: AppBar(
          title: Text(title),
          actions: const [
            PositionedButton(),
            Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 5,
          backgroundColor:
              Theme.of(context).colorScheme.background.withOpacity(0.8),
          selectedFontSize: 15,
          unselectedLabelStyle:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                color: Theme.of(context).iconTheme.color,
              ),
              label: 'Tasks',
            ),
            BottomNavigationBarItem(
              label: 'History',
              icon: Icon(
                Icons.history,
                color: Theme.of(context).iconTheme.color,
              ),
            )
          ],
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
        ),
        body: content,
      ),
    );
  }
}
