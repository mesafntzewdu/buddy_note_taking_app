import 'package:buddy/screen/add_task.dart';
import 'package:buddy/screen/appointment.dart';
import 'package:buddy/screen/task.dart';
import 'package:buddy/widget/side_navigation.dart';
import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

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
    Widget content = const Task();

    if (selectedIndex == 1) {
      title = 'Appointments';
      content = const Appointment();
    }
    return Scaffold(
      drawer: const SideNavBar(),
      appBar: AppBar(
        title: Text(title),
      ),
      bottomNavigationBar: MoltenBottomNavigationBar(
        barColor: Theme.of(context).colorScheme.onSecondaryContainer,
        domeCircleColor: Theme.of(context).colorScheme.onSecondaryContainer,
        selectedIndex: selectedIndex,
        onTabChange: (clickedIndex) {
          setState(() {
            selectedIndex = clickedIndex;
          });
        },
        tabs: [
          MoltenTab(
            title: Text('Tasks',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.background)),
            icon: Icon(Icons.list,
                color: Theme.of(context).colorScheme.onSecondary),
          ),
          MoltenTab(
            title: Text(
              'Appointments',
              style: TextStyle(color: Theme.of(context).colorScheme.background),
            ),
            icon: Icon(Icons.calendar_month,
                color: Theme.of(context).colorScheme.onSecondary),
          ),
        ],
      ),
      body: content,
    );
  }
}
