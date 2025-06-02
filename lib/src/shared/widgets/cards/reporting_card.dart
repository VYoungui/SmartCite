import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:smart_cite/src/shared/widgets/text_icon.dart';

import '../../../core/theme/dimens.dart';
import '../../enum/button_style.dart';
import '../buttons/validated_button.dart';

class ReportingCard extends StatelessWidget {
  final String image;
  final String category;
  final String description;
  const ReportingCard(
      {super.key,
      required this.image,
      required this.category,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.only(left: Dimens.padding, right: Dimens.padding),
      padding: const EdgeInsets.only(
          left: Dimens.padding,
          right: Dimens.padding,
          top: Dimens.doublePadding,
          bottom: Dimens.doublePadding),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(Dimens.halfRadius)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                height: 46,
                width: 51,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          image,
                        ),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(Dimens.halfRadius)),
              ),
              const SizedBox(width: Dimens.halfPadding,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withAlpha(75)),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: Dimens.doublePadding,
          ),
          Container(
            height: 1,
            color: Theme.of(context).colorScheme.onSurface.withAlpha(75),
          ),
          const SizedBox(
            height: Dimens.doublePadding,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextIcon(
                icon: Iconsax.calendar,
                text: 'Dimanche, 12 Juin',
              ),
              TextIcon(icon: Iconsax.clock, text: 'En attente'),
            ],
          ),
          const SizedBox(
            height: Dimens.doublePadding,
          ),
          ValidatedButton(
            title: 'Détails',
            onPressed: () {},
            buttonStyle: ValidatedButtonStyle.roundedGreen,
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
}
