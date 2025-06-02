import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_cite/src/core/theme/dimens.dart';

class DashCard extends StatelessWidget {
  final String title;
  final String number;
  const DashCard({super.key, required this.title, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 131,
      height: 90,
      padding: const EdgeInsets.all(Dimens.halfPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.halfRadius),
          color: Theme.of(context).colorScheme.secondary),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          Text(number,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.primary)),
        ],
      ),
    );
  }
}
