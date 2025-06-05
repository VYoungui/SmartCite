import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_cite/src/shared/widgets/fields/input_text_field.dart';
import 'package:smart_cite/src/shared/enum/inputfield_style.dart';

void main() {
  testWidgets('InputTextField displays label, accepts input, and validates',
          (WidgetTester tester) async {
        final controller = TextEditingController();
        String? errorText;
        String? lastChanged;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: InputTextField(
                key: const Key('inputTextField'),
                title: 'Nom',
                label: 'Votre nom',
                align: TextAlign.start,
                controller: controller,
                enabled: true,
                obscureText: false,
                inputFieldStyle: InputFieldStyle.input,
                onChanged: (value) {
                  lastChanged = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    errorText = 'Champ requis';
                    return errorText;
                  }
                  return null;
                },
              ),
            ),
          ),
        );

        // Vérifie la présence du label
        expect(find.text('Votre nom'), findsOneWidget);

        // Saisir du texte
        await tester.enterText(find.byKey(const Key('inputTextField')), 'Jean');
        await tester.pump();

        // Vérifie le texte saisi
        expect(controller.text, 'Jean');
        expect(lastChanged, 'Jean');

        // Effacer le champ pour déclencher le validateur
        await tester.enterText(find.byKey(const Key('inputTextField')), '');
        await tester.pump();

        // Le validateur doit retourner une erreur
        expect(errorText, 'Champ requis');
      });
}
