part of 'task_bloc.dart';

@immutable
abstract class TaskState {}

class TaskInitial extends TaskState {}

class TasksLoadInProgress extends TaskState {}

class TasksLoadSuccess extends TaskState {
  final List<TaskModel> tasks;
  TasksLoadSuccess(this.tasks);
}

class TaskLoadFailure extends TaskState {
  final String error;
  TaskLoadFailure(this.error);
}

class TaskAddedSuccess extends TaskState {
  final TaskModel task;
  TaskAddedSuccess(this.task);
}

class TaskAddedFailure extends TaskState {
  final String error;
  TaskAddedFailure(this.error);
}

class TaskUpdatedSuccess extends TaskState {
  final TaskModel task;
  TaskUpdatedSuccess(this.task);
}

class TaskUpdatedFailure extends TaskState {
  final String error;
  TaskUpdatedFailure(this.error);
}

class TaskDeletedSuccess extends TaskState {
  final int taskId; // The ID of the deleted task
  TaskDeletedSuccess(this.taskId);
}

class TaskDeletedFailure extends TaskState {
  final String error;
  TaskDeletedFailure(this.error);
}
