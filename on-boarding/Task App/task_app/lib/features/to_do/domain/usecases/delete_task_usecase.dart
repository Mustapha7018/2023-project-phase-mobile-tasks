import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../repositories/domain_task_repo.dart';


class DeleteTask {
  final TaskRepository repository;

  DeleteTask(this.repository);

  Future<Either<Failure, void>> call(int taskId) {
    return repository.deleteTask(taskId);
  }
}
