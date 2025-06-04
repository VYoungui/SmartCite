import 'package:flutter/material.dart';
import 'package:smart_cite/src/core/theme/dimens.dart';

class TextIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  const TextIcon({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Icon(icon, color: Theme.of(context).colorScheme.onSurface.withAlpha(75),),
      const SizedBox(width: Dimens.minPadding,),
      Text(text, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.onSurface.withAlpha(75)),)
    ],);
  }
}
