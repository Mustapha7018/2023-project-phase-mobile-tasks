import 'package:dartz/dartz.dart' hide Task;

import '../../../../core/errors/failure.dart';
import '../entities/add_task.dart';
import '../repositories/domain_task_repo.dart';

class AddTask {
  final TaskRepository repository;

  AddTask(this.repository);

  Future<Either<Failure, Task>> call(String title, String description, DateTime? dueDate) {
    return repository.addTask(title, description, dueDate!);
  }
}
