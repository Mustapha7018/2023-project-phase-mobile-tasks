import 'package:flutter/material.dart';

class TasksDetailView extends StatelessWidget {
  const TasksDetailView({super.key});

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
            Center(
              child: Image.asset('assets/shopping_list.png'),
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
                    child: const TextField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
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
                    child: const TextField(
                      // enabled: false,
                      keyboardType: TextInputType.multiline,
                      maxLines: 2,
                      decoration: InputDecoration(
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
                    child: const TextField(
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 25, horizontal: 15),
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
