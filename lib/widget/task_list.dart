import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:buddy/model/task.dart';
import 'package:buddy/provider/delete_provider.dart';
import 'package:buddy/screen/update.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key, required this.data});

  final TaskModel data;

  @override
  Widget build(context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (context, child) => ThemeSwitchingArea(
        child: Consumer<DeleteProvider>(
          builder: (ctx, value, child) => Slidable(
            endActionPane: ActionPane(
              motion: const DrawerMotion(),
              children: [
                SlidableAction(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      bottomLeft: Radius.circular(10.r)),
                  flex: 1,
                  onPressed: (_) {
                    value.deleteTask(data);
                  },
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: const Color(0xFFFFFFFF),
                  icon: Icons.delete,
                  color: Colors.red,
                ),
                SlidableAction(
                  onPressed: (_) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) {
                          return UpdateTask(data: data);
                        },
                      ),
                    );
                  },
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  foregroundColor: const Color(0xFFFFFFFF),
                  icon: Icons.edit,
                  color: Colors.green,
                ),
                SlidableAction(
                  onPressed: (_) {
                    value.doneTask(
                      TaskModel(
                        id: data.id,
                        title: data.title,
                        description: data.description,
                        endDate: data.endDate,
                        reminder: data.reminder,
                        done: 'done',
                      ),
                    );
                  },
                  backgroundColor:
                      Theme.of(context).colorScheme.onSecondaryContainer,
                  foregroundColor: const Color(0xFFFFFFFF),
                  icon: Icons.done,
                  color: Colors.blue,
                ),
              ],
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.0.w,
                  ),
                  child: GlassContainer(
                    border: const Border.fromBorderSide(BorderSide.none),
                    blur: 4,
                    width: double.infinity,
                    height: 200.h,
                    color: Colors.grey.withOpacity(1),
                    shadowColor: Colors.black.withOpacity(0.3),
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey.withOpacity(0.3),
                        Colors.black.withOpacity(0.8),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0.h),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      data.title.toUpperCase(),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                Positioned(
                  left: 20.w,
                  top: 45.h,
                  right: 20.w,
                  bottom: 50.h,
                  child: Text(
                    data.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Positioned(
                  left: 20.w,
                  bottom: 10.h,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.date_range,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        data.endDate,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 265.w,
                  bottom: 10.h,
                  child: Row(
                    children: [
                      Text(
                        data.reminder,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      const Icon(
                        Icons.alarm,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
