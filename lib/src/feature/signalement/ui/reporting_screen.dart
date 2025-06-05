import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_cite/src/core/theme/dimens.dart';
import 'package:smart_cite/src/feature/signalement/logic/reporting_cubit.dart';
import 'package:smart_cite/src/shared/enum/avatar_style.dart';
import 'package:smart_cite/src/shared/enum/button_style.dart';
import 'package:smart_cite/src/shared/enum/inputfield_style.dart';
import 'package:smart_cite/src/shared/widgets/app_avatar.dart';
import 'package:smart_cite/src/shared/widgets/buttons/validated_button.dart';
import 'package:smart_cite/src/shared/widgets/cards/reporting_card.dart';
import 'package:smart_cite/src/shared/widgets/fields/input_text_field.dart';

class ReportingScreen extends StatefulWidget {
  const ReportingScreen({super.key});

  @override
  State<ReportingScreen> createState() => _ReportingScreenState();
}

class _ReportingScreenState extends State<ReportingScreen> {
  final TextEditingController researchController = TextEditingController();
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReportingCubit()..getReports(),
      child: BlocListener<ReportingCubit, ReportingState>(
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
        child: SafeArea(
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
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
              body: Column(
                children: [
                  ValidatedButton(
                      title: 'Signaler un problème',
                      onPressed: () {
                        context.go('/create-report');
                      },
                      buttonStyle: ValidatedButtonStyle.roundedGreen,
                      width: MediaQuery.of(context).size.width),
                  const SizedBox(
                    height: Dimens.doublePadding,
                  ),
                  InputTextField(
                      align: TextAlign.start,
                      controller: researchController,
                      enabled: true,
                      onChanged: (p0) {
                        setState(() {
                          searchQuery = p0;
                        });
                      },
                      validator: (p0) {
                        return '';
                      },
                      obscureText: false,
                      title: '',
                      inputFieldStyle: InputFieldStyle.search),
                  const SizedBox(
                    height: Dimens.doublePadding,
                  ),
                  BlocBuilder<ReportingCubit, ReportingState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        empty: () => Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/empty.jpg'),
                            const SizedBox(
                              height: Dimens.halfPadding,
                            ),
                            Text(
                              'Oups ! Aucun signalement pour le moment',
                              maxLines: 2,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withAlpha(75)),
                            )
                          ],
                        )),
                        success: (reports) => Expanded(
                          child: ListView.builder(
                            itemCount: reports
                                .where(
                                  (element) => element.description
                                      .toLowerCase()
                                      .contains(searchQuery.toLowerCase()),
                                )
                                .toList()
                                .length, // Number of items in the list
                            itemBuilder: (context, index) {
                              return ReportingCard(
                                problems: reports
                                    .where(
                                      (element) => element.description
                                          .toLowerCase()
                                          .contains(searchQuery.toLowerCase()),
                                    )
                                    .toList()[index],
                              );
                            },
                          ),
                        ),
                        orElse: () => const SizedBox.shrink(),
                      );
                    },
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  context.go('/create-report');
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimens.halfRadius),
                      color: Theme.of(context).colorScheme.primary),
                  child: Center(
                    child: Icon(
                      Iconsax.add,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
