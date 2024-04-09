import 'package:flutter/material.dart';

import 'package:task_app/task_detail.dart';

class NewTaskView extends StatefulWidget {
  const NewTaskView({super.key});

  @override
  State<NewTaskView> createState() => _NewTaskViewState();
}

class _NewTaskViewState extends State<NewTaskView> {
  DateTime? dueDate;

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
            Navigator.pop(context);
          },
        ),
        leadingWidth: 80,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Create new task',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),

            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      'Main task name',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(238, 111, 87, 1),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),

                  Container(
                    height: 125,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      elevation: 4,
                      child: const TextField(
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'UI/UX Design',
                          hintStyle: TextStyle(fontSize: 20),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 25),
                        ),
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      'Due date',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(238, 111, 87, 1),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),

                  Container(
                    height: 125,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 4,
                      child: const TextField(
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'April 29, 2024 12:30 AM',
                          hintStyle: TextStyle(fontSize: 20),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 25),
                          suffixIcon: Padding(
                            padding: EdgeInsetsDirectional.only(end: 18),
                            child: Icon(
                              Icons.event,
                              color: Color.fromRGBO(238, 111, 87, 1),
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(238, 111, 87, 1),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),

                  Container(
                    height: 125,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      elevation: 4,
                      child: const TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          // hintText: 'April 29, 2024 12:30 AM',
                          hintStyle: TextStyle(fontSize: 20),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 25),
                        ),
                      ),
                    ),
                  ),

                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 60),
                      child: ElevatedButton(
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TasksDetailView(),
                            ),
                          );
                        },

                        child: const Text(
                          'Add Task',
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
            ),
          ],
        ),
      ),
    );
  }
}
