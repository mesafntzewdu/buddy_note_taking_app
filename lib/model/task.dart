class TaskModel {
  final int id;
  final String title;
  final String description;
  final String endDate;
  final String reminder;
  final String done;

  const TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.endDate,
    required this.reminder,
    required this.done,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        endDate: json['end_date'],
        reminder: json['reminder'],
        done: json['done'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'end_date': endDate,
        'reminder': reminder,
        'done': done,
      };
}
