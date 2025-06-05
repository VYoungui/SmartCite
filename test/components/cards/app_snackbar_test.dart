import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_cite/src/shared/widgets/cards/app_snackbar.dart';

void main() {
  testWidgets('AppSnackbar displays correct message', (WidgetTester tester) async {
    const testMessage = 'Un message de test';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => Center(
              child: ElevatedButton(
                key: const Key('showSnackbarButton'),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const AppSnackbar(message: testMessage) as SnackBar,
                  );
                },
                child: const Text('Afficher Snackbar'),
              ),
            ),
          ),
        ),
      ),
    );

    // Action
    await tester.tap(find.byKey(const Key('showSnackbarButton')));
    await tester.pump(); // Affiche le SnackBar

    // Assert
    expect(find.text(testMessage), findsOneWidget);
  });
}
