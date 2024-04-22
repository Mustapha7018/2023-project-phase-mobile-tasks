part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class TaskAdded extends TaskEvent {
  final TaskModel task;
  TaskAdded(this.task);
}

class TaskUpdated extends TaskEvent {
  final TaskModel task;
  TaskUpdated(this.task);
}

class TaskDeleted extends TaskEvent {
  final int taskId;
  TaskDeleted(this.taskId);
}

class TasksLoaded extends TaskEvent {}

class TaskCompleted extends TaskEvent {
  final int taskId;
  TaskCompleted(this.taskId);
}

class TaskFetched extends TaskEvent {
  final int taskId;
  TaskFetched(this.taskId);
}
