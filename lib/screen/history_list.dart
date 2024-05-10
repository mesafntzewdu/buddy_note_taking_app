import 'package:buddy/model/task.dart';
import 'package:buddy/provider/delete_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:provider/provider.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key, required this.data});

  final TaskModel data;

  @override
  Widget build(context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (context, child) => Consumer<DeleteProvider>(
        builder: (ctx, value, child) => Slidable(
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    bottomLeft: Radius.circular(10.r)),
                onPressed: (_) {
                  value.deleteTask(data);
                },
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: const Color(0xFFFFFFFF),
                icon: Icons.delete,
                label: 'Delete',
                color: Colors.red,
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
                top: 70.h,
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
    );
  }
}
