import 'package:flutter/material.dart';
import '../../domain/entities/add_task.dart';



@immutable
abstract class TaskState {}

class InitialState extends TaskState {}

class LoadingState extends TaskState {}

class LoadedAllTasksState extends TaskState {
  final List<Task> tasks;
  LoadedAllTasksState(this.tasks);
}

class LoadedSingleTaskState extends TaskState {
  final Task task;
  LoadedSingleTaskState(this.task);
}

class ErrorState extends TaskState {
  final String error;
  ErrorState(this.error);
}
