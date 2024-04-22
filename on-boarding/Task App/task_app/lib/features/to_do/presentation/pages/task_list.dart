import 'package:flutter/material.dart';

import '../../../../core/utils/date_format.dart';
import '../../domain/entities/add_task.dart';
import '../../../../core/utils/accent_color.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_button.dart';
import 'edit_task.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({super.key});

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  List<Task> taskList = [];
  List<Color> statusColors = [
    const Color.fromRGBO(255, 81, 81, 1),
    const Color.fromRGBO(251, 195, 67, 1),
    const Color.fromRGBO(59, 219, 56, 1)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.primaryColor,
            size: 30,
          ),
          onPressed: () {
            // Back to splash
            Navigator.pop(context, taskList);
          },
        ),
        title: const Text(
          'Task List',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 22,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Image.asset('assets/stick_man2.png'),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Task list',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ...taskList.reversed.map((_task) {
                    return GestureDetector(
                      onTap: () async {
                        Task? task = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditTaskView(),
                            settings: RouteSettings(
                                arguments: _task, name: '/taskDetail'),
                          ),
                        );

                        if (task != null) {
                          setState(() {
                            _task.title = task.title;
                            _task.description = task.description;
                            _task.dueDate = task.dueDate;
                            _task.status = task.status;
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 136, 136, 136)
                                  .withOpacity(0.1),
                              spreadRadius: 1.0,
                            ),
                          ],
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 10,
                        ),
                        child: Card(
                          surfaceTintColor: Colors.white,
                          borderOnForeground: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            leading: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                _task.title[0].toUpperCase(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            title: SizedBox(
                              width: 10,
                              child: Text(
                                _task.title,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            trailing: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  formatDate(_task.dueDate!),
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
                                    color: statusColors[_task.status.index],
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: CustomElevatedButton(
                key: const Key('Create Task Button'),
                text: 'Create Task',
                onPressed: () async {
                  // Route to New Task
                  // Task? task =
                  //     await Navigator.pushNamed(context, '/newTask') as Task?;

                  // if (task != null) {
                  //   setState(() {
                  //     if (task.title != '' &&
                  //         task.description != '' &&
                  //         task.dueDate != null) {
                  //       taskList.add(Task(
                  //         task.title,
                  //         task.description,
                  //         task.dueDate,
                  //       ));
                  //     }
                  //   });
                  // }
                },
                backgroundColor: const Color.fromRGBO(238, 111, 87, 1),
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
    );
  }
}
