import 'package:dartz/dartz.dart' hide Task;

import '../../../../core/errors/failure.dart';
import '../entities/add_task.dart';
import '../repositories/task_repo.dart';


class GetTask {
  final TaskRepository repository;

  GetTask(this.repository);

  Future<Either<Failure, Task>> call(int id) {
    return repository.getTask(id);
  }
}
