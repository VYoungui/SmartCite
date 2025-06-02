import 'package:flutter/material.dart';

class AppSnackbar extends StatelessWidget {
  final String message;
  const AppSnackbar({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      content: Text(message,
          style: Theme.of(context).textTheme.bodyLarge,
    ));
  }
}
