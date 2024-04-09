import 'package:flutter/material.dart';

import 'package:task_app/new_task.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

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
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    margin: const EdgeInsets.only(bottom: 15),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      elevation: 4,
                      child: ListTile(
                        leading: const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'U',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        title: const Text(
                          'UI/UX App \nDesign',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text('3 Tasks'),
                        trailing: SizedBox(
                          width: 107,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'April 24, 2024',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),

                              const SizedBox(width: 10),
                              Container(
                                height: 60,
                                width: 4,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(255, 81, 81, 1),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    margin: const EdgeInsets.only(bottom: 15),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      elevation: 4,
                      child: ListTile(
                        leading: const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'U',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w400),
                          ),
                        ),

                        title: const Text(
                          'UI/UX App \nDesign',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),

                        subtitle: const Text('3 Tasks'),

                        trailing: SizedBox(
                          width: 107,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'April 24, 2024',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),

                              const SizedBox(width: 10),
                              Container(
                                height: 60,
                                width: 4,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(59, 219, 56, 1),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    margin: const EdgeInsets.only(bottom: 15),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      elevation: 4,
                      child: ListTile(
                        leading: const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'U',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w400),
                          ),
                        ),

                        title: const Text(
                          'UI/UX App \nDesign',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),

                        subtitle: const Text('3 Tasks'),
                        trailing: SizedBox(
                          width: 107,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'April 24, 2024',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                height: 60,
                                width: 4,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(251, 195, 67, 1),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    margin: const EdgeInsets.only(bottom: 15),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      elevation: 4,
                      child: ListTile(
                        leading: const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'V',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w400),
                          ),
                        ),

                        title: const Text(
                          'Visit my \nFamily',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),

                        subtitle: const Text('3 Tasks'),
                        trailing: SizedBox(
                          width: 107,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'April 24, 2024',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),

                              const SizedBox(width: 10),
                              Container(
                                height: 60,
                                width: 4,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(255, 81, 81, 1),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    margin: const EdgeInsets.only(bottom: 15),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      elevation: 4,
                      child: ListTile(
                        leading: const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'L',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w400),
                          ),
                        ),

                        title: const Text(
                          'Solve Daily \nLeetcode',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),

                        subtitle: const Text('3 Tasks'),
                        trailing: SizedBox(
                          width: 107,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'April 24, 2024',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                height: 60,
                                width: 4,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(59, 219, 56, 1),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  backgroundColor: const Color.fromRGBO(238, 111, 87, 1),
                ),
                onPressed: () {
                  // Route to Task Lists
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewTaskView(),
                    ),
                  );
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
