import 'package:buddy/model/task.dart';
import 'package:buddy/service/database_helper.dart';
import 'package:flutter/material.dart';

class DeleteProvider extends ChangeNotifier {
  TaskModel? taskModel;

  //create a toggle button to delete tasks
  void deleteTask(TaskModel taskModel) async {
    DbHelper.delete(taskModel);
    this.taskModel = taskModel;
    notifyListeners();
  }

  void doneTask(TaskModel model) {
    DbHelper.completeTask(model);
    notifyListeners();
  }
}
