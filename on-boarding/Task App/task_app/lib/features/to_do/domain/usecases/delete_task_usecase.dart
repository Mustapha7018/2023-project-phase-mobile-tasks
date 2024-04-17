import '../repositories/task_repo.dart';

class DeleteTask {
  final TaskRepository repository;

  DeleteTask(this.repository);

  void call(int taskId) {
    repository.deleteTask(taskId);
  }
}
