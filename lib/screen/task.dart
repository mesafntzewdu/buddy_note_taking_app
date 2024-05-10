import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:buddy/model/task.dart';
import 'package:buddy/provider/delete_provider.dart';
import 'package:buddy/screen/add_task.dart';
import 'package:buddy/service/database_helper.dart';
import 'package:buddy/widget/task_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Task extends StatelessWidget {
  Task({
    super.key,
  });
  Future<List<TaskModel>?> tasks = DbHelper.getAll();
  @override
  Widget build(context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (context, child) => Consumer<DeleteProvider>(
        builder: (context, value, child) => ThemeSwitchingArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Theme.of(context).iconTheme.color,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const AddTask();
                    },
                  ),
                );
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
                  return const Center(
                    child: Text('Loading....'),
                  );
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error fetching'),
                  );
                }
                if (!snapshot.hasData) {
                  return Center(
                    child: Lottie.asset(
                      'assets/note_list.json',
                      width: 300.w,
                      height: 300.h,
                    ),
                  );
                }
                var snapCopy = snapshot.data;
                final deleteData = context.watch<DeleteProvider>();
                snapCopy!.removeWhere((e) =>
                    e.id ==
                    (deleteData.taskModel == null
                        ? 0
                        : deleteData.taskModel!.id));

                if (snapCopy.isEmpty) {
                  return Task();
                }

                return ListView.builder(
                  itemCount: snapCopy.length,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0.h),
                      child: TaskList(
                        data: snapCopy[index],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
