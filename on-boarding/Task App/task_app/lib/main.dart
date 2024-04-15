import 'package:flutter/material.dart';

import 'package:task_app/customs/animations/custom_animations.dart';
import 'package:task_app/new_task.dart';
import 'package:task_app/splash.dart';
import 'package:task_app/task_detail.dart';
import 'package:task_app/task_list.dart';

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
