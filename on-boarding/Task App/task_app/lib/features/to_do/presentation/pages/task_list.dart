import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/features/to_do/data/models/todo_model.dart';
import 'package:task_app/features/to_do/presentation/pages/edit_task.dart';

import '../../../../core/utils/date_format.dart';
import '../../../../core/utils/accent_color.dart';
import '../bloc/task_bloc.dart';
import '../bloc/task_event.dart';
import '../bloc/task_state.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_button.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({super.key});

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              color: AppColors.primaryColor, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Task List',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 22)),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(child: Image.asset('assets/stick_man2.png')),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text('Task list',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: BlocBuilder<TodoBloc, TaskState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is LoadedAllTasksState) {
                  return buildTaskList(
                      context, state.tasks); // This will build the UI for tasks
                } else if (state is ErrorState) {
                  return Center(child: Text('Error: ${state.error}'));
                }
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.list_alt,
                        size: 100,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 15),
                      Text(
                        'No Tasks Found',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: CustomElevatedButton(
                key: const Key('Create Task Button'),
                text: 'Create Task',
                onPressed: () async {
                  TaskModel newTask =
                      await Navigator.pushNamed(context, '/newTask')
                          as TaskModel;
                  context.read<TodoBloc>().add(CreateTaskEvent(newTask));
                },
                backgroundColor: AppColors.primaryColor,
                borderRadius: 5.0,
                padding: const EdgeInsets.symmetric(horizontal: 100),
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTaskList(BuildContext context, List<TaskModel> tasks) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:
            tasks.reversed.map((task) => buildTaskCard(context, task)).toList(),
      ),
    );
  }

  Widget buildTaskCard(BuildContext context, TaskModel task) {
    return GestureDetector(
      onTap: () async {
        TaskModel updatedTask = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EditTaskView(),
            settings: RouteSettings(arguments: task, name: '/taskDetail'),
          ),
        );
        context.read<TodoBloc>().add(UpdateTaskEvent(updatedTask));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 136, 136, 136).withOpacity(0.1),
              spreadRadius: 1.0,
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Card(
          surfaceTintColor: Colors.white,
          borderOnForeground: true,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            leading: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                task.title[0].toUpperCase(),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w400),
              ),
            ),
            title: SizedBox(
              width: 10,
              child: Text(
                task.title,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            trailing: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  formatDate(task.dueDate),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 50,
                  width: 4,
                  decoration: BoxDecoration(
                    color: StatusColors.statusColors[task.status.index],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: CustomElevatedButton(
                      key: const Key('Create Task Button'),
                      text: 'Create Task',
                      onPressed: () async {
                        TaskModel newTask =
                            await Navigator.pushNamed(context, '/newTask')
                                as TaskModel;
                        if (mounted) {
                          context
                              .read<TodoBloc>()
                              .add(CreateTaskEvent(newTask));
                        }
                      },
                      backgroundColor: AppColors.primaryColor,
                      borderRadius: 5.0,
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
