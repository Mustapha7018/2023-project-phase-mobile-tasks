import 'package:dartz/dartz.dart' hide Task;

import '../../../../core/errors/failure.dart';
import '../entities/add_task.dart';
import '../repositories/domain_task_repo.dart';


class GetAllTasks {
  final TaskRepository repository;

  GetAllTasks(this.repository);

  Future<Either<Failure, List<Task>>> call() {
    return repository.getAllTasks();
  }
}
