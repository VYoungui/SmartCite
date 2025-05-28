import 'package:flutter/material.dart';
import '../../../core/theme/dimens.dart';
import '../../enum/button_style.dart';

class ValidatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final ValidatedButtonStyle buttonStyle;
  const ValidatedButton(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.buttonStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin:
          const EdgeInsets.only(left: Dimens.padding, right: Dimens.padding),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              WidgetStatePropertyAll(buttonStyle == ValidatedButtonStyle.valid
                  ? Theme.of(context).colorScheme.primary
                  : buttonStyle == ValidatedButtonStyle.critic
                      ? Theme.of(context).colorScheme.error
                      : buttonStyle == ValidatedButtonStyle.outline
                          ? Colors.transparent
                          : Theme.of(context).colorScheme.secondary),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  buttonStyle == ValidatedButtonStyle.roundedGreen
                      ? Dimens.radius
                      : Dimens.halfRadius))),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: buttonStyle == ValidatedButtonStyle.valid
                  ? Theme.of(context).colorScheme.onPrimary
                  : buttonStyle == ValidatedButtonStyle.critic
                      ? Theme.of(context).colorScheme.onError
                      : Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
