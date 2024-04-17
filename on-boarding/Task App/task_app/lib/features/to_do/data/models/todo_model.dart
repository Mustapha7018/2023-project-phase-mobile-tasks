import '../../domain/entities/add_task.dart';

class TaskModel extends Task{

  TaskModel({
    required super.id,
    required super.title,
    required super.description,
    required super.dueDate,
  });


  Map<String, dynamic> toJson() =>{
    'id' : id,
    'title' : title,
    'description' : description,
    'dueDate' : dueDate,
  };
  
}
