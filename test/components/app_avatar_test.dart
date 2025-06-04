import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_cite/src/shared/widgets/app_avatar.dart';
import 'package:smart_cite/src/shared/enum/avatar_style.dart';

void main() {
  testWidgets('AppAvatar with profile style shows image and badge',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppAvatar(
                key: const Key('profileAvatar'),
                avatarStyle: AvatarStyle.profile,
              ),
            ),
          ),
        );

        // Vérifie qu'une image de profil est présente
        final profileImageFinder = find.byType(Container);
        expect(profileImageFinder, findsWidgets);

        // Vérifie qu'une icône de modification est présente (edit icon dans le badge)
        expect(find.byIcon(Icons.edit), findsOneWidget);
      });

  testWidgets('AppAvatar with home style shows CircleAvatar without badge',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppAvatar(
                key: const Key('homeAvatar'),
                avatarStyle: AvatarStyle.home,
              ),
            ),
          ),
        );

        // Vérifie qu'un CircleAvatar est utilisé
        expect(find.byType(CircleAvatar), findsOneWidget);

        // Vérifie que l’icône de modification n’est pas présente
        expect(find.byIcon(Icons.edit), findsNothing);
      });
}
