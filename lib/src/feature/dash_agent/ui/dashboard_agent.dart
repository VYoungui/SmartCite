import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smart_cite/src/shared/widgets/cards/dash_card.dart';

import '../../../core/theme/dimens.dart';
import '../../../shared/enum/avatar_style.dart';
import '../../../shared/widgets/app_avatar.dart';
import '../../../shared/widgets/cards/reporting_card.dart';
import '../../signalement/logic/reporting_cubit.dart';

class DashboardAgentScreen extends StatelessWidget {
  const DashboardAgentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReportingCubit()..getReports(),
      child: const DashboardAgent(),
    );
  }
}

class DashboardAgent extends StatelessWidget {
  const DashboardAgent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReportingCubit, ReportingState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (message) {
            var snackBar = SnackBar(
              content: Text(message,
                  style: GoogleFonts.poppins(
                      color: Theme.of(context).colorScheme.error)),
              backgroundColor: Theme.of(context).colorScheme.onError,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: Dimens.padding, right: Dimens.padding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bonjour,',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withAlpha(75)),
                      ),
                      Text(
                        'Hey Axelle',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        context.go('/profile');
                      },
                      child: const AppAvatar(avatarStyle: AvatarStyle.home))
                ],
              ),
            )),
        body: BlocBuilder<ReportingCubit, ReportingState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => Skeletonizer(
                  child: Column(
                children: [
                  DashCard(title: 'Signalements', number: '12'),
                  DashCard(title: 'Le plus recuurent', number: 'Bonaberi'),
                  Row(
                    children: [
                      Text(
                        'Signalements récents ',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withAlpha(75)),
                      ),
                      GestureDetector(
                        onTap: () => context.go('/see-more'),
                        child: Text(
                          'Voir plus',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    ],
                  )
                ],
              )),
              success: (reports) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: Dimens.padding,
                      right: Dimens.padding,
                      top: Dimens.space/2,
                      bottom: Dimens.space/2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DashCard(title: 'Signalements', number: reports.length.toString()),
                        DashCard(title: 'Signalements', number: reports.length.toString()),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: Dimens.padding,
                      right: Dimens.padding,
                      top: Dimens.space/2,
                      bottom: Dimens.space/2,
                    ),
                    child: Row(
                      children: [
                        DashCard(title: 'Le plus recuurent', number: reports.length.toString()),
                        DashCard(title: 'Le plus recuurent', number: reports.length.toString()),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Signalements récents ',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withAlpha(75)),
                      ),
                      GestureDetector(
                        onTap: () => context.go('/see-more'),
                        child: Text(
                          'Voir plus',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: reports.length, // Number of items in the list
                      itemBuilder: (context, index) {
                        return ReportingCard(
                          problems: reports[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}
