import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_cite/src/feature/signalement/model/problems_model.dart';
import 'package:smart_cite/src/feature/signalement/ui/reporting_details.dart';
import 'package:smart_cite/src/shared/widgets/text_icon.dart';

import '../../../core/theme/dimens.dart';
import '../../enum/button_style.dart';
import '../buttons/validated_button.dart';

class ReportingCard extends StatelessWidget {
  final Problems problems;
  const ReportingCard(
      {super.key,
      required this.problems});

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
                        image:problems.image_url==null? const AssetImage('assets/images/empty.jpg') : NetworkImage(
                          problems.image_url!,
                        ),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(Dimens.halfRadius)),
              ),
              const SizedBox(
                width: Dimens.halfPadding,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    problems.category.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    problems.description,
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
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextIcon(
                icon: Iconsax.calendar_2,
                text: 'Dimanche, 12 Juin',
              ),
              TextIcon(icon: Iconsax.clock, text: problems.status!.name),
            ],
          ),
          const SizedBox(
            height: Dimens.doublePadding,
          ),
          ValidatedButton(
            title: 'Détails',
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>  ReportingDetails(problems: problems),
              ));
            },
            buttonStyle: ValidatedButtonStyle.roundedGreen,
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
}
