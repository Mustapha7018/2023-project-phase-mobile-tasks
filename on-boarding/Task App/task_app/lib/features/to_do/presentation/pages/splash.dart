import 'package:flutter/material.dart';
import 'package:task_app/core/utils/accent_color.dart';

import '../widgets/custom_button.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Expanded(
                flex: 7,
                child: Image.asset(
                  key: const Key('Stickman Image'),
                  'assets/stick_man.png',
                ),
              ),
              
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: CustomElevatedButton(
                    text: 'Get Started',
                    onPressed: () {
                      // Route to Task Lists
                      Navigator.pushNamed(context, '/taskList');
                    },
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
