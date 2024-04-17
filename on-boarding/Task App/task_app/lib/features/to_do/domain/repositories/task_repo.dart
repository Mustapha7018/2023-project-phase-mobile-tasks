import '../entities/add_task.dart';

abstract class TaskRepository {
  List<Task> getAllTasks();

  Task addTask(String title, String description, DateTime? dueDate);

  void updateTask(Task task);
  
  void deleteTask(int taskId);
}
