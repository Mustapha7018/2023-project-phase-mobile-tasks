class Task {
  String? title, description, status;
  DateTime? dueDate;

  // constructor
  Task(this.title, this.description, this.dueDate) : status = 'pending';

  @override
  String toString() {
    return 'Title: $title\nDescription: $description\nDue Date: ${dueDate.toString()}\nStatus: $status\n';
  }
  
}

class TaskManager {

  List<Task> tasks = [];
  
  void addTask(Task newTask) {

    if (newTask.title == '' || newTask.description == '') {
      print('Invalid task! Make sure you provide the right details');
      return;
    }

    tasks.add(newTask);
  }


  void viewTasks() {
    
    for (var task in tasks) {
      print(task);
    }
  }


  void viewCompletedTasks() {

    for (var task in tasks) {
      if (task.status == 'completed') {
        print(task);
      }
    }
  }


  void viewPendingTasks() {

    for (var task in tasks) {
      if (task.status == 'pending') {
        print(task);
      }
    }
    
  }

  
  void editTask(int index, {String? title, String? description, String? status, DateTime? dueDate}) {

    if (index < 0 || index >= tasks.length) {
      print('The task you are trying to edit does not exist.');
      return;
    }

    if ((status != null && status != 'pending' && status != 'completed') || title == '' || description == '') {
      print('Invalid update. Input the right details.');
      return;
    }

    var task = tasks[index];
    task.title = title ?? task.title;
    task.description = description ?? task.description;
    task.dueDate = dueDate ?? task.dueDate;
    task.status = status ?? task.status;
  }



  void deleteTask(int index) {
    
    if (index < 0 || index >= tasks.length) {
      print('The task you are trying to delete does not exist.');
      return;
    }

    tasks.removeAt(index);
    print('Task deleted successfully.');


  }
}


void main() {
  // Testing instances and methods
  TaskManager newTaskManager = TaskManager();
  Task newTask1 = Task('Solve Leetcode', 'Solve one leetcode by close of today', DateTime(2024, 4, 3));
  Task newTask2 = Task('Standup meeting', 'Meet the scrum tomorrow', DateTime(2024, 4, 4));
  Task newTask3 = Task('Go hiking', 'Go hiking at Shai Hills ', DateTime(2024, 5, 23));

  newTaskManager.addTask(newTask1);
  newTaskManager.addTask(newTask2);
  newTaskManager.addTask(newTask3);
  newTaskManager.editTask(1, title: 'Updated Standup Meeting');
  newTaskManager.editTask(0, description: '');
  newTaskManager.viewTasks();
  newTaskManager.viewPendingTasks();
  newTaskManager.viewCompletedTasks();
  newTaskManager.deleteTask(7); 
  newTaskManager.deleteTask(2); 
  newTaskManager.viewTasks();
}
