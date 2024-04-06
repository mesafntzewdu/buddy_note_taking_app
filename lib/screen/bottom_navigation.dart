import 'package:buddy/screen/appointment.dart';
import 'package:buddy/screen/task.dart';
import 'package:buddy/widget/side_navigation.dart';
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        onPressed: () {
          print('text');
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: 'Appointments'),
        ],
        onTap: (val) {
          setState(() {
            selectedIndex = val;
            print(selectedIndex);
          });
        },
        currentIndex: selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.onSecondaryContainer,
      ),
      body: content,
    );
  }
}
