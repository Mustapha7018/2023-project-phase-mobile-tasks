import 'package:dartz/dartz.dart' hide Task;

import '../../../../core/errors/failure.dart';
import '../entities/add_task.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<Task>>> getAllTasks();
  Future<Either<Failure, Task>> getTask(int id);
  Future<Either<Failure, Task>> addTask(String title, String description, DateTime dueDate);
  Future<Either<Failure, void>> updateTask(Task task);
  Future<Either<Failure, void>> deleteTask(int taskId);
}
