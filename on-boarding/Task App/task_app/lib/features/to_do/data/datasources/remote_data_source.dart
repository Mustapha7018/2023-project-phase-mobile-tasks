import 'package:task_app/features/to_do/data/models/todo_model.dart';


abstract class TaskRemoteDataSource {
  Future<List<TaskModel>> fetchTasks();
  Future<TaskModel?> getTask(int id);
  Future<TaskModel> addTask(String title, String description, DateTime dueDate);
  Future<void> updateTask(TaskModel task);
  Future<void> deleteTask(int taskId);
}
