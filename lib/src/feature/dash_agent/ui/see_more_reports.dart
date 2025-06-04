import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/dimens.dart';
import '../../../shared/enum/inputfield_style.dart';
import '../../../shared/widgets/cards/reporting_card.dart';
import '../../../shared/widgets/fields/input_text_field.dart';
import '../../signalement/logic/reporting_cubit.dart';

class SeeMoreReportsScreen extends StatefulWidget {
  const SeeMoreReportsScreen({super.key});

  @override
  State<SeeMoreReportsScreen> createState() => _SeeMoreReportsScreenState();
}

class _SeeMoreReportsScreenState extends State<SeeMoreReportsScreen> {
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
        child: Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
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
                  title: 'Categorie',
                  inputFieldStyle: InputFieldStyle.search),
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
        ),
      ),
    );
  }
}
