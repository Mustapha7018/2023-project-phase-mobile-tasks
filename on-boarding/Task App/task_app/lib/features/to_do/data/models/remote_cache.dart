import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_app/features/to_do/data/models/todo_model.dart';

import '../datasources/remote_data_source.dart';

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final http.Client client;
  final String baseUrl = '';

  TaskRemoteDataSourceImpl(this.client);

  @override
  Future<List<TaskModel>> fetchTasks() async {
    final response = await client.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((taskJson) => TaskModel.fromJson(taskJson)).toList();
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  @override
  Future<TaskModel?> getTask(int id) async {
    final response = await client.get(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      return TaskModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      return null;
    } else {
      throw Exception('Failed to get task');
    }
  }

  @override
  Future<TaskModel> addTask(
      String title, String description, DateTime dueDate) async {
    final response = await client.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'title': title,
        'description': description,
        'dueDate': dueDate.toIso8601String(),
      }),
    );
    
    if (response.statusCode == 201) {
      return TaskModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to add task');
    }
  }

  @override
  Future<void> updateTask(TaskModel task) async {
    final response = await client.put(
      Uri.parse('$baseUrl/${task.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(task.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update task');
    }
  }

  @override
  Future<void> deleteTask(int taskId) async {
    final response = await client.delete(Uri.parse('$baseUrl/$taskId'));
    if (response.statusCode != 204) {
      throw Exception('Failed to delete task');
    }
  }
}
