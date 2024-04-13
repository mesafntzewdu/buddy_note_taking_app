import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:buddy/model/task.dart';
import 'package:buddy/screen/add_task.dart';
import 'package:buddy/service/database_helper.dart';
import 'package:buddy/widget/task_list.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Task extends StatelessWidget {
  Task({
    super.key,
  });

  Future<List<TaskModel>?> tasks = DbHelper.getAll();

  @override
  Widget build(context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).iconTheme.color,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const AddTask();
            }));
          },
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.background,
          ),
        ),
        body: FutureBuilder(
          future: tasks,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: Text('Loading....'));
            }
            if (snapshot.hasError) {
              return const Center(child: Text('Error fetching'));
            }
            if (!snapshot.hasData) {
              return Center(
                child: Lottie.asset(
                  'assets/emptylist.json',
                  width: 300,
                  height: 300,
                ),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: TaskList(data: snapshot.data![index]),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
