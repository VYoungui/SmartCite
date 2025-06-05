import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_cite/src/shared/widgets/buttons/validated_button.dart';

import '../../../core/theme/dimens.dart';
import '../../../shared/enum/button_style.dart';


class Unboarding2Screen extends StatefulWidget {
  const Unboarding2Screen({super.key});

  @override
  State<Unboarding2Screen> createState() => _Unboarding2Screen();


}

class _Unboarding2Screen extends State<Unboarding2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: Dimens.doubleSpace,
              ),
              Image.asset(
                  'assets/images/notification.png',
                  width: 222,
                  height: 260,
                  fit: BoxFit.cover
              ),
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                    'Recevez une notification une fois votre problème traité',
                    textAlign: TextAlign.center,
                    style:
                    Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    )
                ),
              ),
              const SizedBox(height: 80),
              SizedBox(
                width: 360, // Largeur augmentée
                height: 50, // Hauteur augmentée
                child: ValidatedButton(
                  title: 'Connexion',
                  onPressed: () {
                    context.go('/login');
                  },
                  buttonStyle: ValidatedButtonStyle.valid, width: MediaQuery.of(context).size.width,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 360, // Largeur augmentée
                height: 50, // Hauteur augmentée
                child: ValidatedButton(
                  title: 'Inscription',
                  onPressed: () {
                    context.go('/login');
                  },
                  buttonStyle: ValidatedButtonStyle.outline, width: MediaQuery.of(context).size.width,
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }

}