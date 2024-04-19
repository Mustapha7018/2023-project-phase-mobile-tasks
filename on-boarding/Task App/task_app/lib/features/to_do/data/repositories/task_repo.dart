import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../datasources/local_interface.dart';
import '../models/todo_model.dart';


/// [DateTime.now().millisecondsSinceEpoch] generates a unique ID using DateTime


class TaskRepository {
  final TaskLocalDataSource dataSource;

  TaskRepository(this.dataSource);

  Future<String> addTask(
      String? title, String? description, DateTime dueDate) async {
    if (title == null ||
        title.isEmpty ||
        description == null ||
        description.isEmpty) {
      throw CacheFailure(message: 'Invalid input: Fields must not be empty');
    }
    try {
      TaskModel task = TaskModel(
          id: DateTime.now().millisecondsSinceEpoch,
          title: title,
          description: description,
          dueDate: dueDate);
      await dataSource.cacheTask(task);
      return 'Task Added Successfully';
    } catch (e) {
      throw CacheFailure(message: 'Failed to cache the task');
    }
  }

  Future<List<TaskModel>> getAllTasks() async {
    Either<Failure, List<TaskModel>> result = await dataSource.getAllTasks();
    return result.fold(
        (failure) =>
            throw CacheFailure(message: 'Failed to retrieve tasks from cache'),
        (taskList) => taskList);
  }

  Future<TaskModel> getTask(int id) async {
    Either<Failure, TaskModel> result = await dataSource.getTask(id);
    return result.fold(
        (failure) => throw CacheFailure(message: 'Task not found in cache'),
        (task) => task);
  }

  Future<void> updateTask(TaskModel taskToUpdate) async {
    Either<Failure, void> result = await dataSource.updateTask(taskToUpdate);
    return result.fold(
        (failure) =>
            throw CacheFailure(message: 'Failed to update the task in cache'),
        (r) => r);
  }

  Future<void> deleteTask(int id) async {
    Either<Failure, void> result = await dataSource.deleteTask(id);
    return result.fold(
        (failure) => throw CacheFailure(
            message:
                'Failed to delete the task from cache'),
        (r) => r);
  }
}
