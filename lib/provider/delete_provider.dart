import 'package:buddy/model/task.dart';
import 'package:buddy/service/database_helper.dart';
import 'package:flutter/material.dart';

class DeleteProvider extends ChangeNotifier {
  TaskModel? taskModel;

  //create a toggle button to delete tasks
  void deleteTask(TaskModel taskModel) async {
    await DbHelper.delete(taskModel);
    this.taskModel = taskModel;
    notifyListeners();
  }

  void doneTask(TaskModel taskModel) async {
    await DbHelper.completeTask(taskModel);
    this.taskModel = TaskModel(
      id: taskModel.id,
      title: taskModel.title,
      description: taskModel.description,
      endDate: taskModel.endDate,
      reminder: taskModel.reminder,
      done: 'live',
    );
    notifyListeners();
  }
}
