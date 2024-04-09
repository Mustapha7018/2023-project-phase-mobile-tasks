import 'package:flutter/material.dart';

import 'package:task_app/task_list.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 111, 87, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Image.asset('assets/stick_man.png'),
              ),

              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 120),
                      backgroundColor: const Color.fromRGBO(12, 140, 233, 1),
                    ),

                    onPressed: () {
                      // Route to Task Lists
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TaskListView(),
                        ),
                      );
                    },
                    
                    child: const Text(
                      'Get Started',
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
        ),
      ),
    );
  }
}
