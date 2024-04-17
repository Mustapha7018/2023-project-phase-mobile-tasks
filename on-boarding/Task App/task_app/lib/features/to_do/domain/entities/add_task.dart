enum TaskStatus { notStarted, inProgress, completed }

class Task {
  final int id;
  String title, description;
  DateTime? dueDate;
  TaskStatus status;

  // constructor
  Task({required this.id, required this.title, required this.description, this.dueDate,
      this.status = TaskStatus.notStarted});


  @override
  String toString() {
    return 'Title: $title\nDescription: $description\nDue Date: ${dueDate.toString()}\nStatus: ${status.toString()}';
  }
}
