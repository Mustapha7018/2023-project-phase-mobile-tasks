import 'package:intl/intl.dart';
import '../../domain/entities/add_task.dart';


class TaskModel extends Task {
  TaskModel({
    required super.id,
    required super.title,
    required super.description,
    required super.dueDate,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      dueDate: DateFormat("yyyy-MM-ddTHH:mm:ss").parse(json['dueDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dueDate': DateFormat("yyyy-MM-ddTHH:mm:ss").format(dueDate!),
    };
  }
}

