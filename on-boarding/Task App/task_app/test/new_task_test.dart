import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_app/new_task.dart';
import 'utils.dart';


void main() {
  testWidgets('Test New Task Fields', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const NewTaskView()));
    final formFields = find.byType(TextField);

    expect(formFields, findsNWidgets(3));
  });
}