import 'package:dartz/dartz.dart' hide Task;

import '../../../../core/errors/failure.dart';
import '../../domain/entities/add_task.dart';


class TaskRepository {
  final List<Task> _tasks = [];
  int _counter = 1;


  Future<Either<Failure, String>> createTask(
      String? title, String? description, DateTime dueDate) async {
    try {
      if (title != null &&
          title.isNotEmpty &&
          description != null &&
          description.isNotEmpty) {
        _tasks.add(Task(
            id: _counter++,
            title: title,
            description: description,
            dueDate: dueDate));
        return const Right('Task Added Successfully');
      } else {
        return const Left(
            Failure(message: 'Invalid input: Fields must not be empty'));
      }
    } catch (e) {
      return Left(Failure(
          message:
              'An error occurred while creating the task: ${e.toString()}'));
    }
  }


  Future<Either<Failure, List<Task>>> viewAllTasks() async {
    if (_tasks.isNotEmpty) {
      return Right(_tasks);
    } else {
      return const Left(Failure(message: 'No tasks available'));
    }
  }


  Future<Either<Failure, String>> updateTask(Task taskToUpdate) async {
    try {
      final int index = _tasks.indexWhere((task) => task.id == taskToUpdate.id);

      _tasks[index] = taskToUpdate;
      return const Right('Task updated successfully');
    } catch (e) {
      return const Left(
          Failure(message: 'An error occurred while updating the task'));
    }
  }


  Future<Either<Failure, String>> deleteTask(int id) async {
    try {
      final int index = _tasks.indexWhere((task) => task.id == id);

      _tasks.removeAt(index);
      return const Right('Task deleted successfully');
    } catch (e) {
      return const Left(
          Failure(message: 'An error occurred while deleting the task'));
    }
  }
}
