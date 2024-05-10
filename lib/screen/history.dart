import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:buddy/model/task.dart';
import 'package:buddy/provider/delete_provider.dart';
import 'package:buddy/screen/history_list.dart';
import 'package:buddy/service/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class History extends StatelessWidget {
  History({
    super.key,
  });

  Future<List<TaskModel>?> history = DbHelper.getAllHistory();

  @override
  Widget build(context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (context, child) => ThemeSwitchingArea(
        child: Consumer<DeleteProvider>(
          builder: (context, value, child) => Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: FutureBuilder(
              future: history,
              builder: (context, sp) {
                if (sp.hasError) {
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
                    width: 300.w,
                    height: 300.h,
                  ));
                }

                var snapCopy = sp.data;
                final deleteData = context.watch<DeleteProvider>();

                snapCopy!.remove(deleteData.taskModel);
                if (snapCopy.isEmpty) {
                  return History();
                }
                return ListView.builder(
                  itemCount: snapCopy.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0.h),
                    child: HistoryList(data: snapCopy[index]),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
