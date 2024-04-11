import 'package:flutter/material.dart';

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
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(238, 111, 87, 1),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),

                  Container(
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
                      vertical: 15,
                    ),
                    child: Card(
                      surfaceTintColor: Colors.white,
                      borderOnForeground: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                      child: const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: TextField(
                          keyboardType: TextInputType.name,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Eg. UI/UX Design',
                            hintStyle: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(137, 137, 137, 1)),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 20),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      'Due date',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(238, 111, 87, 1),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),

                  Container(
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
                      vertical: 15,
                    ),
                    child: Card(
                      surfaceTintColor: Colors.white,
                      borderOnForeground: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: TextField(
                          keyboardType: TextInputType.datetime,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'yyyy-mm-dd',
                            hintStyle: const TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(137, 137, 137, 1)),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 20),
                            suffixIcon: Padding(
                              padding: const EdgeInsetsDirectional.only(end: 1),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.event,
                                  color: Color.fromRGBO(238, 111, 87, 1),
                                  size: 24,
                                ),
                                onPressed: () {
                                  showDatePicker(
                                      context: context,
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2025, 1, 1));
                                },
                              ),
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
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(238, 111, 87, 1),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),

                  Container(
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
                      vertical: 15,
                    ),
                    child: Card(
                      surfaceTintColor: Colors.white,
                      borderOnForeground: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                      child: const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 3,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 20),
                          ),
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
                          Navigator.pushNamed(context, '/taskDetail');
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


