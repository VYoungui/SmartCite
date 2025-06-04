import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_cite/src/shared/widgets/cards/state_card.dart';

class StateWidget extends StatelessWidget {
  const StateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        StateCard(icon: Iconsax.clock, status: 'En attente', date: '', completed: true,),
        StateCard(icon: Iconsax.status, status: 'En Cours', date: '', completed: false,),
        StateCard(icon: Iconsax.tick_circle, status: 'Resolu', date: '', completed: false,),
    ]
    );
  }
}
