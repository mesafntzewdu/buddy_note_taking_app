import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:buddy/model/task.dart';
import 'package:buddy/screen/history_list.dart';
import 'package:buddy/service/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Appointment extends StatelessWidget {
  Appointment({
    super.key,
  });

  Future<List<TaskModel>?> history = DbHelper.getAllHistory();

  @override
  Widget build(context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: FutureBuilder(
          future: history,
          builder: (context, sp) {
            if (sp.hasData) {
              return const Center(
                child: Text('Error happened'),
              );
            }
            if (sp.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Text('Loading'),
              );
            }
            if (!sp.hasData) {
              return Center(
                  child: Lottie.asset(
                'assets/emptylist.json',
                width: 300,
                height: 300,
              ));
            }
            return ListView.builder(
              itemBuilder: (context, index) =>
                  HistoryList(data: sp.data![index]),
            );
          },
        ),
      ),
    );
  }
}
