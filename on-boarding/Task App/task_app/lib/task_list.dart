import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:task_app/customs/functions/add_task.dart';
import 'package:task_app/task_detail.dart';

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

  String formatDate(DateTime date) {
    final formater = DateFormat('MMM dd, yyy');
    return formater.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color.fromRGBO(238, 111, 87, 1),
            size: 30,
          ),
          onPressed: () {
            // Back to splash
            Navigator.pop(context, taskList);
          },
        ),
        leadingWidth: 80,
        title: const Text(
          'Todo List',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w400, fontSize: 22),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 25),
            child: const Icon(
              Icons.more_vert,
              color: Colors.black,
              size: 35,
            ),
          ),
        ],
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
                  ...taskList.map((_task) {
                    return GestureDetector(
                      onTap: () async {
                        Task? task = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TasksDetailView(),
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
                              padding: const EdgeInsets.only(left: 10),
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
              child: ElevatedButton(
                key: const Key('Create Task Button'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  backgroundColor: const Color.fromRGBO(238, 111, 87, 1),
                ),
                onPressed: () async {
                  // Route to Task Detail
                  // Map<String, Object>? task =
                  Task? task =
                      await Navigator.pushNamed(context, '/newTask') as Task?;

                  if (task != null) {
                    setState(() {
                      if (task.title != '' &&
                          task.description != '' &&
                          task.dueDate != null) {
                        taskList.add(Task(
                          task.title,
                          task.description,
                          task.dueDate,
                        ));
                      }
                    });
                  }
                },
                child: const Text(
                  'Create Task',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
