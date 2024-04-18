import 'dart:convert';
import 'package:dartz/dartz.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/features/to_do/data/models/todo_model.dart';

import '../../../../core/errors/failure.dart';
import 'local_interface.dart';

class SharedPreferencesTaskLocalDataSource implements TaskLocalDataSource {
  final SharedPreferences sharedPreferences;

  SharedPreferencesTaskLocalDataSource(this.sharedPreferences);

  static const String cachedTaskKey = 'CACHED_TASKS';

  @override
  Future<void> cacheTask(TaskModel task) async {
    final cachedTasks = sharedPreferences.getString(cachedTaskKey) ?? '{}';
    final tasksMap = json.decode(cachedTasks) as Map<String, dynamic>;
    tasksMap['task_${task.id}'] = task.toJson();
    await sharedPreferences.setString(cachedTaskKey, json.encode(tasksMap));
  }

  @override
  Future<Either<Failure, TaskModel>> getTask(int id) async {
    try {
      final cachedTasks = sharedPreferences.getString(cachedTaskKey) ?? '{}';
      final tasksMap = json.decode(cachedTasks) as Map<String, dynamic>;
      if (tasksMap.containsKey('task_$id')) {
        return Right(TaskModel.fromJson(tasksMap['task_$id']));
      } else {
        return const Left(Failure(message: 'Task not found'));
      }
    } catch (e) {
      return const Left(Failure(message: 'Failed to retrieve task'));
    }
  }

  @override
  Future<Either<Failure, List<TaskModel>>> getAllTasks() async {
    try {
        final cachedTasks = sharedPreferences.getString(cachedTaskKey) ?? '{}';
        final tasksMap = json.decode(cachedTasks) as Map<String, dynamic>;
        List<TaskModel> tasks = tasksMap.values.map((taskJson) => TaskModel.fromJson(taskJson)).toList();
        return Right(tasks);
    } catch (e) {
        return const Left(Failure(message: 'Failed to retrieve tasks'));
    }
}

}
