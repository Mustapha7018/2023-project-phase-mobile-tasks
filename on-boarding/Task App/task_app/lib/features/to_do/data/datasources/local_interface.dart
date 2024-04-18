import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/todo_model.dart';


abstract class TaskLocalDataSource {
  Future<void> cacheTask(TaskModel task);  
  Future<Either<Failure, TaskModel>> getTask(int id);  
  Future<Either<Failure, List<TaskModel>>> getAllTasks();
}
