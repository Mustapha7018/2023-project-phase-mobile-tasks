import 'package:bloc/bloc.dart';
import 'package:task_app/features/to_do/presentation/bloc/task_event.dart';
import 'package:task_app/features/to_do/presentation/bloc/task_state.dart';

import '../../data/models/todo_model.dart';
import '../../data/repositories/task_repo.dart';


class TodoBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository repository;

  TodoBloc(this.repository) : super(InitialState()) {
    on<LoadAllTasksEvent>(_onLoadAllTasks);
    on<GetSingleTaskEvent>(_onGetSingleTask);
    on<UpdateTaskEvent>(_onUpdateTask);
    on<DeleteTaskEvent>(_onDeleteTask);
    on<CreateTaskEvent>(_onCreateTask);
  }

  void _onLoadAllTasks(LoadAllTasksEvent event, Emitter<TaskState> emit) async {
    emit(LoadingState());
    try {
      List<TaskModel> tasks = await repository.getAllTasks();
      emit(LoadedAllTasksState(tasks));
    } catch (failure) {
      emit(ErrorState(failure.toString()));
    }
  }

  void _onGetSingleTask(GetSingleTaskEvent event, Emitter<TaskState> emit) async {
    emit(LoadingState());
    try {
      TaskModel task = await repository.getTask(event.taskId);
      emit(LoadedSingleTaskState(task));
    } catch (failure) {
      emit(ErrorState(failure.toString()));
    }
  }

  void _onUpdateTask(UpdateTaskEvent event, Emitter<TaskState> emit) async {
    emit(LoadingState());
    try {
      await repository.updateTask(event.task);
      emit(LoadedSingleTaskState(event.task)); 
    } catch (failure) {
      emit(ErrorState(failure.toString()));
    }
  }

  void _onDeleteTask(DeleteTaskEvent event, Emitter<TaskState> emit) async {
    emit(LoadingState());
    try {
      await repository.deleteTask(event.taskId);
      emit(LoadedAllTasksState(await repository.getAllTasks())); 
    } catch (failure) {
      emit(ErrorState(failure.toString()));
    }
  }

  void _onCreateTask(CreateTaskEvent event, Emitter<TaskState> emit) async {
    emit(LoadingState());
    try {
      await repository.addTask(event.task.title, event.task.description, event.task.dueDate);
      emit(LoadedSingleTaskState(event.task)); 
    } catch (failure) {
      emit(ErrorState(failure.toString()));
    }
  }
}
