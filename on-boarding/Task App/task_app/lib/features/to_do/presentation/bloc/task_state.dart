import 'package:flutter/material.dart';
import 'package:task_app/features/to_do/data/models/todo_model.dart';



@immutable
abstract class TaskState {}

class InitialState extends TaskState {}

class LoadingState extends TaskState {}

class LoadedAllTasksState extends TaskState {
  final List<TaskModel> tasks;
  LoadedAllTasksState(this.tasks);
}

class LoadedSingleTaskState extends TaskState {
  final TaskModel task;
  LoadedSingleTaskState(this.task);
}

class ErrorState extends TaskState {
  final String error;
  ErrorState(this.error);
}
