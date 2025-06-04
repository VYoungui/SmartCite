import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_cite/src/shared/widgets/buttons/validated_button.dart';
import 'package:smart_cite/src/shared/widgets/cards/reporting_card.dart';

void main() {
  testWidgets('ReportingCard displays content and button', (WidgetTester tester) async {
    const category = 'Voirie';
    const description = 'Un trou dans la route';
    const imageAsset = 'assets/images/notification.png';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ReportingCard(
            key: Key('reportingCard'),
            image: imageAsset,
            category: category,
            description: description,
          ),
        ),
      ),
    );

    // Assert
    expect(find.byKey(const Key('reportingCard')), findsOneWidget);
    expect(find.text(category), findsOneWidget);
    expect(find.text(description), findsOneWidget);
    expect(find.widgetWithText(ValidatedButton, 'Détails'), findsOneWidget);
    expect(find.text('Dimanche, 12 Juin'), findsOneWidget);
    expect(find.text('En attente'), findsOneWidget);
  });
}
