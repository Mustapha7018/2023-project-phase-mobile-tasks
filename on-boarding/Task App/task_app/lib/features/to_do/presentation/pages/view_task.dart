import 'package:flutter/material.dart';

import '../../../../core/utils/date_format.dart';
import '../../domain/entities/add_task.dart';
import '../../../../core/utils/accent_color.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/field_forms.dart';

class ViewTaskView extends StatefulWidget {
  const ViewTaskView({super.key});

  @override
  State<ViewTaskView> createState() => _ViewTaskViewState();
}

class _ViewTaskViewState extends State<ViewTaskView> {
  DateTime? dueDate;
  String title = '';
  String description = '';
  TaskStatus? selectedValue;

  void fillData(task) {
    dueDate = task.dueDate;
    title = task.title;
    description = task.description;
    selectedValue = task.status;
  }

  @override
  Widget build(BuildContext context) {
    final task = ModalRoute.of(context)!.settings.arguments as Task;

    if (title == '' &&
        description == '' &&
        dueDate == null &&
        selectedValue == null) {
      fillData(task);
    }

    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.primaryColor,
            size: 30,
          ),
          onPressed: () {
            // Back to splash
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Edit Task',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 22,
          ),
        ),
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
                  CustomLabelTextField(
                    label: 'Title',
                    initialValue: title,
                    onChanged: (value) {
                      title = value;
                    },
                    keyboardType: TextInputType.name,
                  ),
                  CustomLabelTextField(
                    label: 'Description',
                    initialValue: description,
                    onChanged: (value) {
                      description = value;
                    },
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                  ),
                  CustomLabelTextField(
                    label: 'Deadline',
                    initialValue: formatDate(dueDate!),
                    onChanged: (value) {},
                    keyboardType: TextInputType.datetime,
                    isDate: true,
                    onDatePressed: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: dueDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2025, 1, 1),
                      );
                      if (picked != null && picked != dueDate) {
                        setState(() {
                          dueDate = picked;
                        });
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Status',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Container(
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
                        child: CustomElevatedButton(
                          text: 'Edit Task',
                          onPressed: () {
                            // Task data = Task(
                            //   title,
                            //   description,
                            //   dueDate,
                            //   status: selectedValue!,
                            // );

                            // Navigator.pop(context, data);
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
            )
          ],
        ),
      ),
    );
  }
}
