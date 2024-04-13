import 'dart:convert';

import 'package:flutter/material.dart';

class TaskModel {
  final int id;
  final String title;
  final String description;
  final String endDate;
  final String reminder;

  const TaskModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.endDate,
      required this.reminder});

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        endDate: json['end_date'],
        reminder: json['reminder'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'end_date': endDate,
        'reminder': reminder,
      };
}
