import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_cite/src/shared/widgets/cards/dash_card.dart';

void main() {
  testWidgets('DashCard shows title and number', (WidgetTester tester) async {
    const testTitle = 'Problèmes';
    const testNumber = '42';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DashCard(
            key: Key('dashCard'),
            title: testTitle,
            number: testNumber,
          ),
        ),
      ),
    );

    // Assert
    expect(find.byKey(const Key('dashCard')), findsOneWidget);
    expect(find.text(testTitle), findsOneWidget);
    expect(find.text(testNumber), findsOneWidget);
  });
}
