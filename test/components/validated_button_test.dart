import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_cite/src/shared/enum/button_style.dart';
import 'package:smart_cite/src/shared/widgets/buttons/validated_button.dart';

void main() {
  testWidgets('ValidatedButton displays title and reacts to tap', (WidgetTester tester) async {
    // Arrange
    const buttonText = 'Valider';
    bool wasPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ValidatedButton(
            title: buttonText,
            onPressed: () {
              wasPressed = true;
            },
            buttonStyle: ValidatedButtonStyle.valid,
            width: 200,
          ),
        ),
      ),
    );

    // Assert
    final buttonFinder = find.text(buttonText);
    expect(buttonFinder, findsOneWidget); // vérifie que le texte est présent

    // Act
    await tester.tap(buttonFinder);
    await tester.pump(); // rafraîchit le widget après l'appui

    // Assert
    expect(wasPressed, isTrue); // vérifie que le callback a été appelé
  });
}
