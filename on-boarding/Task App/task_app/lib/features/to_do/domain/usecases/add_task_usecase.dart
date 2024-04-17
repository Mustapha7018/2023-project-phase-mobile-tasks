import '../entities/add_task.dart';
import '../repositories/task_repo.dart';

class AddTask {
  final TaskRepository repository;

  AddTask(this.repository);

  Task call(String title, String description, DateTime? dueDate) {
    return repository.addTask(title, description, dueDate);
  }
}
