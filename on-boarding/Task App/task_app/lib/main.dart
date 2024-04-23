import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/core/utils/accent_color.dart';
import 'package:task_app/features/to_do/presentation/bloc/task_bloc.dart';

import 'core/utils/custom_animations.dart';
import 'features/to_do/data/datasources/local_cache.dart';
import 'features/to_do/data/repositories/task_repo.dart';
import 'features/to_do/presentation/pages/edit_task.dart';
import 'features/to_do/presentation/pages/new_task.dart';
import 'features/to_do/presentation/pages/splash.dart';
import 'features/to_do/presentation/pages/task_list.dart';
import 'features/to_do/presentation/pages/view_task.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  final taskLocalDataSource =
      SharedPreferencesTaskLocalDataSource(sharedPreferences);
  final taskRepository = TaskRepository(taskLocalDataSource);

  runApp(
    BlocProvider(
      create: (context) => TodoBloc(taskRepository),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                  builder: (context) => const SplashScreenView());
            case '/taskList':
              return CustomSlideAnimation(child: const TaskListView());
            case '/editTask':
              return CustomSlideAnimation(child: const EditTaskView());
            case '/newTask':
              return CustomSlideAnimation(child: const NewTaskView());
            case '/viewTask':
              return CustomSlideAnimation(child: const ViewTaskView());
            default:
              return MaterialPageRoute(
                  builder: (context) => const SplashScreenView());
          }
        },
      ),
    ),
  );
}
