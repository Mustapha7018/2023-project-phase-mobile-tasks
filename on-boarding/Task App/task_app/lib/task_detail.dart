import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_app/customs/functions/add_task.dart';

class TasksDetailView extends StatefulWidget {
  const TasksDetailView({super.key});

  @override
  State<TasksDetailView> createState() => _TasksDetailViewState();
}

class _TasksDetailViewState extends State<TasksDetailView> {
  String formatDate(DateTime date) {
    final formater = DateFormat('MMM dd, yyy');
    return formater.format(date);
  }

  DateTime? dueDate;
  String title = '';
  String description = '';
  TaskStatus? selectedValue;

  void fillData(Task task) {
    dueDate = task.dueDate;
    title = task.title;
    description = task.description;
    selectedValue = task.status;
  }

  @override
  Widget build(BuildContext context) {
    final task = ModalRoute.of(context)!.settings.arguments as Task;

    if (title == '' && description == '' && dueDate == null && selectedValue == null) {
      fillData(task);
    }

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
            Navigator.pop(context);
          },
        ),
        leadingWidth: 80,
        title: const Text(
          'Task Detail',
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


      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 220,
              child: Center(
                child: Image.asset(
                  'assets/shopping_list.png',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Title',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 15, bottom: 30),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(241, 238, 238, 1),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextFormField(
                      onChanged: (val) {
                        title = val;
                      },
                      controller: TextEditingController(text: title),
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                      ),
                    ),
                  ),


                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 15, bottom: 30),
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(241, 238, 238, 1),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextFormField(
                      onChanged: (val) {
                        description = val;
                      },
                      controller: TextEditingController(text: description),
                      keyboardType: TextInputType.multiline,
                      maxLines:
                          null, // Allows the input field to expand as needed
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      ),
                    ),
                  ),


                  const Text(
                    'Deadline',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(241, 238, 238, 1),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextFormField(
                      controller:
                          TextEditingController(text: formatDate(dueDate!)),
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 15),
                        suffixIcon: Padding(
                          padding: const EdgeInsetsDirectional.only(end: 1),
                          child: IconButton(
                            icon: const Icon(
                              Icons.event,
                              color: Color.fromRGBO(238, 111, 87, 1),
                              size: 24,
                            ),
                            onPressed: () async {
                              final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: task.dueDate,
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2025, 1, 1),
                              );

                              if (picked != null && picked != task.dueDate) {
                                setState(() {
                                  dueDate = picked;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  const Text(
                    'Status',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),

                  Container(
                    // height: 150,
                    margin: const EdgeInsets.only(top: 20),
                    child: DropdownButtonFormField<TaskStatus>(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 15),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(241, 238, 238, 1),
                      ),
                      dropdownColor: const Color.fromRGBO(241, 238, 238, 1),
                      value: selectedValue,
                      onChanged: (TaskStatus? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      itemHeight: 50,
                      items: const <DropdownMenuItem<TaskStatus>>[
                        DropdownMenuItem<TaskStatus>(
                          value: TaskStatus.inProgress,
                          child: Text(
                            'In Progress',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ),
                        DropdownMenuItem<TaskStatus>(
                          value: TaskStatus.notStarted,
                          child: Text(
                            'Not Started',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ),
                        DropdownMenuItem<TaskStatus>(
                          value: TaskStatus.completed,
                          child: Text(
                            'Completed',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),


                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 60),
                      child: ElevatedButton(
                        key: const Key('Update Button'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 15),
                          backgroundColor:
                              const Color.fromRGBO(238, 111, 87, 1),
                        ),
                        onPressed: () {
                          Task data = Task(
                            title,
                            description,
                            dueDate,
                            status: selectedValue!,
                          );

                          Navigator.pop(context, data);
                        },
                        child: const Text(
                          'Update Task',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
