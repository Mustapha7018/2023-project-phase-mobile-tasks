enum TaskStatus { notStarted, inProgress, completed }

class Task {
  String title, description;
  DateTime? dueDate;
  TaskStatus status;

  // constructor
  Task(this.title, this.description, this.dueDate,
      {this.status = TaskStatus.notStarted});


  @override
  String toString() {
    return 'Title: $title\nDescription: $description\nDue Date: ${dueDate.toString()}\nStatus: ${status.toString()}';
  }
}
