import 'package:flutter/material.dart';

import '../../../../core/utils/date_format.dart';
// import '../../domain/entities/add_task.dart';
import '../../../../core/utils/accent_color.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/text_fields.dart';

class NewTaskView extends StatefulWidget {
  const NewTaskView({super.key});

  @override
  State<NewTaskView> createState() => _NewTaskViewState();
}

class _NewTaskViewState extends State<NewTaskView> {
  String name = '';
  String description = '';
  DateTime? date;

  void showingDatePicker() async {
    DateTime? response = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(2025, 1, 1));
    if (response != null) {
      setState(() {
        date = response;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
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

                  CustomLabelTextField(
                    labelText: 'Main task name',
                    hintText: 'Eg. UI/UX Design',
                    onChanged: (val) {
                      name = val;
                    },
                  ),

                  CustomLabelTextField(
                    labelText: 'Due date',
                    hintText: 'Select a date',
                    controller: TextEditingController(
                      text: date == null ? '' : formatDate(date!),
                    ),
                    hasSuffixIcon: true,
                    onSuffixIconPressed: () {
                      showingDatePicker();
                    },
                  ),

                  CustomLabelTextField(
                    labelText: 'Description',
                    hintText: 'Task description',
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                    onChanged: (val) {
                      description = val;
                    },
                  ),
                  
                  Center(
                    child: Container(
                        margin: const EdgeInsets.only(top: 60),
                        child: CustomElevatedButton(
                          text: 'Add Task',
                          onPressed: () {
                            // Task task = Task(
                            //   name,
                            //   description,
                            //   date!,
                            // );
                            // Navigator.pop(context, task);
                          },
                          backgroundColor: AppColors.primaryColor,
                          borderRadius: 50.0,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 15),
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
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
