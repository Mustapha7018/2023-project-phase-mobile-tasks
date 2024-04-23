import 'package:flutter/material.dart';
import '../../data/models/todo_model.dart';

@immutable
abstract class TaskEvent {}

class CreateTaskEvent extends TaskEvent {
  final TaskModel task;
  CreateTaskEvent(this.task);
}

class UpdateTaskEvent extends TaskEvent {
  final TaskModel task;
  UpdateTaskEvent(this.task);
}

class DeleteTaskEvent extends TaskEvent {
  final int taskId;
  DeleteTaskEvent(this.taskId);
}

class LoadAllTasksEvent extends TaskEvent {}

class GetSingleTaskEvent extends TaskEvent {
  final int taskId;
  GetSingleTaskEvent(this.taskId);
}
