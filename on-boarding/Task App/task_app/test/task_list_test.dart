import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:task_app/features/to_do/domain/entities/add_task.dart';
import 'package:task_app/features/to_do/presentation/pages/edit_task.dart';
import 'package:task_app/features/to_do/presentation/pages/task_list.dart';

import 'utils.dart';

void main() {
  // Test Back Button
  testWidgets('Test Back Button Icon', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: const Scaffold(), routes: {
      '/taskList': (context) => const TaskListView(),
    }));

    Navigator.of(tester.element(find.byType(Scaffold))).pushNamed('/taskList');
    await tester.pumpAndSettle();

    expect(find.byType(Scaffold), findsOneWidget);
  });

  // Test Create Task Button
  testWidgets('Test Create Task Button', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const TaskListView()));
    final createButton = find.byKey(const ValueKey('Create Task Button'));

    expect(createButton, findsOneWidget);
  });

  // Test Cards and Images

  testWidgets('Test Task Details', (WidgetTester tester) async {
    final key = GlobalKey<NavigatorState>();
    final args = Task(
        id: 1, title: 'My task', description: 'abc', dueDate: DateTime.now());
    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: key,
        home: ElevatedButton(
          child: const SizedBox(),
          onPressed: () => key.currentState?.push(
            MaterialPageRoute<void>(
              settings: RouteSettings(
                arguments: args,
              ),
              builder: (_) => const EditTaskView(),
            ),
          ),
        ),
      ),
    );

    await tester.pump();
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.byType(TextFormField), findsExactly(3));
    expect(find.byType(Image), findsOneWidget);
  });
}
