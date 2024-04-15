import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:task_app/customs/functions/add_task.dart';

import 'package:task_app/task_detail.dart';
import 'package:task_app/task_list.dart';
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
    final args = Task('My task', 'abc', DateTime.now(), Colors.red);
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
              builder: (_) => const TasksDetailView(),
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
