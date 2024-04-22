import 'package:flutter/material.dart';

import 'package:task_app/core/utils/custom_animations.dart';
import 'package:task_app/features/to_do/presentation/pages/new_task.dart';
import 'package:task_app/features/to_do/presentation/pages/splash.dart';
import 'package:task_app/features/to_do/presentation/pages/edit_task.dart';
import 'package:task_app/features/to_do/presentation/pages/view_task.dart';
import 'package:task_app/features/to_do/presentation/pages/task_list.dart';

void main() {
  runApp(
    MaterialApp(
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
  );
}
