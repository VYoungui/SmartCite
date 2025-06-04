import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_cite/src/core/theme/dimens.dart';

class StateCard extends StatelessWidget {
  final IconData icon;
  final String status;
  final String date;
  final bool completed;
  const StateCard(
      {super.key,
      required this.icon,
      required this.status,
      required this.date,
      required this.completed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Column(
        children: [
          Badge(
              alignment: AlignmentDirectional.bottomEnd,
              isLabelVisible: false,
              largeSize: 6,
              label: Container(
                height: 6,
                width: 6,
                color: Theme.of(context).colorScheme.primary,
                child: const Icon(
                  Iconsax.tick_circle,
                  color: Colors.white,
                ),
              ),
              child: Icon(icon)),
          SizedBox(
            height: Dimens.minPadding,
          ),
          Text('En attente'),
          SizedBox(
            height: Dimens.minPadding,
          ),
          Visibility(
              visible: completed ? true : false, child: Text('204/05/2025'))
        ],
      ),
    );
  }
}
