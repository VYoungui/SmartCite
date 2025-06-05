import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_cite/src/shared/enum/button_style.dart';
import 'package:smart_cite/src/shared/widgets/buttons/validated_button.dart';

void main() {
  testWidgets('ValidatedButton renders and triggers onPressed', (WidgetTester tester) async {
    bool wasPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ValidatedButton(
            key: const Key('validatedButton'),
            title: 'Valider',
            onPressed: () {
              wasPressed = true;
            },
            buttonStyle: ValidatedButtonStyle.valid,
            width: 200,
          ),
        ),
      ),
    );

    // Vérifie que le bouton est affiché
    final buttonFinder = find.byKey(const Key('validatedButton'));
    expect(buttonFinder, findsOneWidget);

    // Vérifie le texte du bouton
    expect(find.text('Valider'), findsOneWidget);

    // Simule un clic
    await tester.tap(buttonFinder);
    await tester.pump();

    // Vérifie que la fonction a été appelée
    expect(wasPressed, isTrue);
  });
}
