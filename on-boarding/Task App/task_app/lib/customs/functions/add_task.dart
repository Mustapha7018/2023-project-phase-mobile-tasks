import 'package:flutter/material.dart';

class Task {
  String title, description;
  DateTime dueDate;
  Color color;

  // constructor
  Task(this.title, this.description, this.dueDate, this.color);

  @override
  String toString() {
    return 'Title: $title\nDescription: $description\nDue Date: ${dueDate.toString()}';
  }
}
