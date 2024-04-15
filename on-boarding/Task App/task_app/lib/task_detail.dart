import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_app/customs/functions/add_task.dart';

class TasksDetailView extends StatefulWidget {
  const TasksDetailView({super.key});

  @override
  State<TasksDetailView> createState() => _TasksDetailViewState();
}

class _TasksDetailViewState extends State<TasksDetailView> {
  DateTime? dueDate;

  @override
  Widget build(BuildContext context) {
    final task = ModalRoute.of(context)!.settings.arguments as Task;
    final TextEditingController titleController =
        TextEditingController(text: task.title);
    final TextEditingController descriptionController =
        TextEditingController(text: task.description);
    final TextEditingController deadlineController = TextEditingController(
        text: DateFormat('MMM dd, yyyy')
            .format(dueDate == null ? task.dueDate : dueDate!));

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
              height: 240,
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
                      controller: titleController,
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
                      controller: descriptionController,
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
                    margin: const EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(241, 238, 238, 1),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextFormField(
                      controller: deadlineController,
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
                          // Route to Task Detail
                          // Navigator.popUntil(context, '/taskList', arguments: task);
                          Map<String, Object> data = {
                            'name': titleController.text,
                            'description': descriptionController.text,
                            'date': deadlineController.text,
                          };
                          // print(deadlineController.text);
                          // print(data);
                          Navigator.pop(context, data);
                          // Navigator.pop(context);
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
