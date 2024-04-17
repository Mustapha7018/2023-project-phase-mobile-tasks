import '../entities/add_task.dart';
import '../repositories/task_repo.dart';

class UpdateTask {
  final TaskRepository repository;

  UpdateTask(this.repository);

  void call(Task task) {
    repository.updateTask(task);
  }
}
