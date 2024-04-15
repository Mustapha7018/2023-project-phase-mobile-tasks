import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:task_app/splash.dart';
import 'utils.dart';

void main() {
  testWidgets('Verify button and image on Splash screen',
      (WidgetTester tester) async {

    //Arrange - Pump SplashScreenView() widget to tester
    await tester.pumpWidget(createTestWidget(const SplashScreenView()));

    //Act - Find button and image by key
    final splashImage = find.byKey(const ValueKey('Stickman Image'));
    final elevatedBtn = find.byKey(const ValueKey('Elevated Button'));

    //Assert - Check that button and image widgets are present
    expect(splashImage, findsOne);
    expect(elevatedBtn, findsOne);
  });
}
