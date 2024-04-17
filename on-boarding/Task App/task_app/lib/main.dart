import 'package:flutter/material.dart';

import 'package:task_app/core/utils/custom_animations.dart';
import 'package:task_app/features/to_do/presentation/pages/new_task.dart';
import 'package:task_app/features/to_do/presentation/pages/splash.dart';
import 'package:task_app/features/to_do/presentation/pages/task_detail.dart';
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
          case '/taskDetail':
            return CustomSlideAnimation(child: const TasksDetailView());
          case '/newTask':
            return CustomSlideAnimation(child: const NewTaskView());
          default:
            return MaterialPageRoute(
                builder: (context) => const SplashScreenView());
        }
      },
    ),
  );
}
