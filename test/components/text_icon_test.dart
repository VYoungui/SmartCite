import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_cite/src/shared/widgets/text_icon.dart'; // ajuste le chemin si besoin

void main() {
  testWidgets('TextIcon displays the icon and text correctly', (WidgetTester tester) async {
    const testText = 'Test label';
    const testIcon = Icons.access_alarm;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TextIcon(
            key: const Key('textIconWidget'),
            icon: testIcon,
            text: testText,
          ),
        ),
      ),
    );

    // Vérifie la présence de l'icône
    expect(find.byIcon(testIcon), findsOneWidget);

    // Vérifie la présence du texte
    expect(find.text(testText), findsOneWidget);
  });
}
