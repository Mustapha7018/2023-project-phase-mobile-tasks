import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../data/models/todo_model.dart';
import '../../data/repositories/task_repo.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository repository;

  TaskBloc({required this.repository}) : super(TaskInitial()) {
    on<TasksLoaded>(_onTasksLoaded);
    on<TaskAdded>(_onTaskAdded);
    on<TaskUpdated>(_onTaskUpdated);
    on<TaskDeleted>(_onTaskDeleted);
  }

  Future<void> _onTasksLoaded(
      TasksLoaded event, Emitter<TaskState> emit) async {
    emit(TasksLoadInProgress());
    try {
      final tasks = await repository.getAllTasks();
      emit(TasksLoadSuccess(tasks));
    } catch (e) {
      emit(TaskLoadFailure(e.toString()));
    }
  }

  Future<void> _onTaskAdded(TaskAdded event, Emitter<TaskState> emit) async {
    try {
      await repository.addTask(
          event.task.title, event.task.description, event.task.dueDate);
      emit(TaskAddedSuccess(event.task));
      add(TasksLoaded());
    } catch (e) {
      emit(TaskAddedFailure(e.toString()));
    }
  }

  Future<void> _onTaskUpdated(
      TaskUpdated event, Emitter<TaskState> emit) async {
    try {
      await repository.updateTask(event.task);
      emit(TaskUpdatedSuccess(event.task));
      add(TasksLoaded()); // Refresh the list
    } catch (e) {
      emit(TaskUpdatedFailure(e.toString()));
    }
  }

  Future<void> _onTaskDeleted(
      TaskDeleted event, Emitter<TaskState> emit) async {
    try {
      await repository.deleteTask(event.taskId);
      emit(TaskDeletedSuccess(event.taskId));
      add(TasksLoaded()); // Refresh the list
    } catch (e) {
      emit(TaskDeletedFailure(e.toString()));
    }
  }
}
