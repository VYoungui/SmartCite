import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_cite/src/shared/widgets/buttons/validated_button.dart';

import '../../../core/theme/dimens.dart';
import '../../../shared/enum/button_style.dart';


class GetStartScreen extends StatefulWidget {
  const GetStartScreen({super.key});

  @override
  State<GetStartScreen> createState() => _GetStartScreen();


}

class _GetStartScreen extends State<GetStartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: Dimens.doubleSpace,
            ),
            Image.asset(
                'assets/images/green-world.png',
                width: 300, 
                height: 270,
                fit: BoxFit.cover
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                  'Signalez vos problèmes urbains en toute simplicité',
                  textAlign: TextAlign.center,
                  style:
                  Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  )
              ),
            ),
            const SizedBox(height: 100),
            SizedBox(
              width: 360, // Largeur augmentée
              height: 50, // Hauteur augmentée
              child: ValidatedButton(
                title: 'Allons-y',
                onPressed: () {
                  context.go('/unboarding1');
                },
                buttonStyle: ValidatedButtonStyle.valid, width: MediaQuery.of(context).size.width,
              ),
            ),
          ],
        ),
      ),
    );

  }

}