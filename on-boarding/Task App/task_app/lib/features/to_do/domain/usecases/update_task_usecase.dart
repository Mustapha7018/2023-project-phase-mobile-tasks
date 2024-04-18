import 'package:dartz/dartz.dart' hide Task;

import '../../../../core/errors/failure.dart';
import '../entities/add_task.dart';
import '../repositories/domain_task_repo.dart';



class UpdateTask {
  final TaskRepository repository;

  UpdateTask(this.repository);

  Future<Either<Failure, void>> call(Task task) {
    return repository.updateTask(task);
  }
}

