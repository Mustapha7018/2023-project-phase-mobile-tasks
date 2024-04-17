import 'package:flutter_test/flutter_test.dart';
import 'package:task_app/features/to_do/data/models/todo_model.dart';

void main() {
  group('TaskModel', () {
    final taskModel = TaskModel(
      id: 1,
      title: "Task Title",
      description: "Task Description",
      dueDate: DateTime(2022, 04, 20, 15, 30), 
    );

    test('should return a valid model from JSON', () {
      // Given
      final Map<String, dynamic> jsonMap = {
        'id': 1,
        'title': 'Task Title',
        'description': 'Task Description',
        'dueDate': '2022-04-20T15:30:00',
      };

      // When
      final result = TaskModel.fromJson(jsonMap);

      // Then
      expect(result, isA<TaskModel>());
      expect(result.id, 1);
      expect(result.title, 'Task Title');
      expect(result.description, 'Task Description');
      expect(result.dueDate, DateTime(2022, 04, 20, 15, 30));
      // print(result);
    });

    test('should return a JSON map containing proper data', () {
      // When
      final result = taskModel.toJson();

      // Then
      final expectedMap = {
        'id': 1,
        'title': 'Task Title',
        'description': 'Task Description',
        'dueDate': '2022-04-20T15:30:00',
      };
      
      expect(result, expectedMap);
      // print(expectedMap);
    });
  });
}
