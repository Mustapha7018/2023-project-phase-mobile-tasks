import '../entities/add_task.dart';
import '../repositories/task_repo.dart';

class GetAllTasks {
  final TaskRepository repository;

  GetAllTasks(this.repository);

  List<Task> call() {
    return repository.getAllTasks();
  }
}
