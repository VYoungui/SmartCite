import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_cite/src/shared/widgets/buttons/validated_button.dart';

import '../../../core/theme/dimens.dart';
import '../../../shared/enum/button_style.dart';


class Unboarding1Screen extends StatefulWidget {
  const Unboarding1Screen({super.key});

  @override
  State<Unboarding1Screen> createState() => _Unboarding1Screen();


}

class _Unboarding1Screen extends State<Unboarding1Screen> {
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
                  'assets/images/Send-money-abroad.png',
                  width: 222,
                  height: 260,
                  fit: BoxFit.cover
              ),
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                    'Visualisez l’état de votre incident et surveillez son traitement',
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
                  title: 'Suivant',
                  onPressed: () {
                    context.go('/unboarding2');
                  },
                  buttonStyle: ValidatedButtonStyle.valid, width: MediaQuery.of(context).size.width,
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }

}