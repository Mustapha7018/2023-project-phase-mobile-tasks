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
      return const Left(
          Failure(message: 'An error occurred while creating the task'));
    }
  }

  Future<Either<Failure, List<Task>>> viewAllTasks() async {
    if (_tasks.isNotEmpty) {
      return Right(_tasks);
    } else {
      return const Left(Failure(message: 'No tasks available'));
    }
  }

  Future<Either<Failure, Task>> viewTask(int id) async {

    try{
    var task = _tasks.firstWhere((t) => t.id == id);
    return Right(task);

    } catch(e) {
      return const Left(Failure(message: 'Task not found'));
    }
    }

  Future<Either<Failure, void>> updateTask(Task taskToUpdate) async {
    int index = _tasks.indexWhere((t) => t.id == taskToUpdate.id);
    if (index != -1) {
      _tasks[index] = taskToUpdate;
      return const Right(null); 
    } else {
      return const Left(Failure(message: 'Task not found'));
    }
  }

  Future<Either<Failure, void>> deleteTask(int id) async {
    int index = _tasks.indexWhere((t) => t.id == id);
    if (index != -1) {
      _tasks.removeAt(index);
      return const Right(null);
    } else {
      return const Left(Failure(message: 'Task not found'));
    }
  }
}
