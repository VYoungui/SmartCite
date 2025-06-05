import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smart_cite/src/core/theme/dimens.dart';
import 'package:smart_cite/src/feature/profile/logic/profile_cubit.dart';
import 'package:smart_cite/src/shared/enum/avatar_style.dart';
import 'package:smart_cite/src/shared/widgets/app_avatar.dart';
import 'package:smart_cite/src/shared/widgets/cards/app_snackbar.dart';

import '../../../shared/enum/button_style.dart';
import '../../../shared/enum/inputfield_style.dart';
import '../../../shared/widgets/buttons/validated_button.dart';
import '../../../shared/widgets/fields/input_text_field.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit()..getProfile(),
      child: const ProfileArea(),
    );
  }
}

class ProfileArea extends StatelessWidget {
  const ProfileArea({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
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
          body: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              return state.maybeWhen(
                  loading: () => Skeletonizer(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const AppAvatar(avatarStyle: AvatarStyle.profile),
                          const SizedBox(
                            height: Dimens.doublePadding,
                          ),
                          Text(
                            'Axelle KWAMOU',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onSurface),
                          ),
                          const SizedBox(
                            height: Dimens.halfPadding,
                          ),
                          Text(
                            '@AxelleK',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withAlpha(75),
                                    ),
                          ),
                          const SizedBox(
                            height: Dimens.doublePadding,
                          ),
                          InputTextField(
                              align: TextAlign.start,
                              controller: TextEditingController(text: 'Douala'),
                              enabled: true,
                              onChanged: (p0) {},
                              validator: (p0) {
                                return '';
                              },
                              obscureText: false,
                              title: 'Ville',
                              inputFieldStyle: InputFieldStyle.profile),
                          InputTextField(
                              align: TextAlign.start,
                              controller: TextEditingController(text: 'Bonaberi'),
                              enabled: true,
                              onChanged: (p0) {},
                              validator: (p0) {
                                return '';
                              },
                              obscureText: false,
                              title: 'Quartier',
                              inputFieldStyle: InputFieldStyle.profile),
                          InputTextField(
                              align: TextAlign.start,
                              controller: TextEditingController(
                                  text: 'akwamou@gmail.com'),
                              enabled: true,
                              onChanged: (p0) {},
                              validator: (p0) {
                                return '';
                              },
                              obscureText: false,
                              title: 'Adresse Mail',
                              inputFieldStyle: InputFieldStyle.profile),
                          const SizedBox(
                            height: Dimens.doublePadding,
                          ),
                          ValidatedButton(
                              title: 'Modifier',
                              onPressed: () {
                                var snackBar = const AppSnackbar(
                                        message:
                                            'Fonctionnalité pas encore disponible')
                                    .build(context);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              buttonStyle: ValidatedButtonStyle.valid,
                              width: MediaQuery.of(context).size.width),
                          const SizedBox(
                            height: Dimens.doublePadding,
                          ),
                          ValidatedButton(
                              title: 'Deconnexion',
                              onPressed: () {
                                var snackBar = const AppSnackbar(
                                        message:
                                            'Fonctionnalité pas encore disponible')
                                    .build(context);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              buttonStyle: ValidatedButtonStyle.outline,
                              width: MediaQuery.of(context).size.width),
                          const SizedBox(
                            height: Dimens.doublePadding,
                          ),
                          ValidatedButton(
                              title: 'Supprimer le compte',
                              onPressed: () {
                                var snackBar = const AppSnackbar(
                                        message:
                                            'Fonctionnalité pas encore disponible')
                                    .build(context);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              buttonStyle: ValidatedButtonStyle.critic,
                              width: MediaQuery.of(context).size.width),
                        ],
                      )),
                  success: (user) => Scaffold(
                    appBar: PreferredSize(
                        preferredSize: const Size.fromHeight(50),
                        child: Padding(
                          padding: const EdgeInsets.all(Dimens.halfPadding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    if (user.role.length>6){
                                      print(user.role);
                                      context.go('/reports');
                                    } else {
                                      context.go('/dash');
                                    }
                                  },
                                  icon: Icon(Iconsax.arrow_left, color: Theme.of(context).colorScheme.onSurface, )),
                            ],
                          ),
                        )),
                    body: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const AppAvatar(avatarStyle: AvatarStyle.profile),
                            const SizedBox(
                              height: Dimens.doublePadding,
                            ),
                            Text(
                              user.full_name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.onSurface),
                            ),
                            const SizedBox(
                              height: Dimens.halfPadding,
                            ),
                            Text(
                              '@${user.full_name}',
                              style:
                                  Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface
                                            .withAlpha(75),
                                      ),
                            ),
                            const SizedBox(
                              height: Dimens.doublePadding,
                            ),
                            InputTextField(
                                align: TextAlign.start,
                                controller: TextEditingController(text: 'Douala'),
                                enabled: true,
                                onChanged: (p0) {},
                                validator: (p0) {
                                  return '';
                                },
                                obscureText: false,
                                title: 'Ville',
                                inputFieldStyle: InputFieldStyle.profile),
                            InputTextField(
                                align: TextAlign.start,
                                controller: TextEditingController(text: 'Bonaberi'),
                                enabled: true,
                                onChanged: (p0) {},
                                validator: (p0) {
                                  return '';
                                },
                                obscureText: false,
                                title: 'Quartier',
                                inputFieldStyle: InputFieldStyle.profile),
                            const SizedBox(
                              height: Dimens.doublePadding,
                            ),
                            ValidatedButton(
                                title: 'Modifier',
                                onPressed: () {
                                  var snackBar = const AppSnackbar(
                                          message:
                                              'Fonctionnalité pas encore disponible')
                                      .build(context);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                buttonStyle: ValidatedButtonStyle.valid,
                                width: MediaQuery.of(context).size.width),
                            const SizedBox(
                              height: Dimens.doublePadding,
                            ),
                            ValidatedButton(
                                title: 'Deconnexion',
                                onPressed: () {
                                  var snackBar = const AppSnackbar(
                                          message:
                                              'Fonctionnalité pas encore disponible')
                                      .build(context);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                buttonStyle: ValidatedButtonStyle.outline,
                                width: MediaQuery.of(context).size.width),
                            const SizedBox(
                              height: Dimens.doublePadding,
                            ),
                            ValidatedButton(
                                title: 'Supprimer le compte',
                                onPressed: () {
                                  var snackBar = const AppSnackbar(
                                          message:
                                              'Fonctionnalité pas encore disponible')
                                      .build(context);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                buttonStyle: ValidatedButtonStyle.critic,
                                width: MediaQuery.of(context).size.width),
                          ],
                        ),
                  ),
                  orElse: () => const SizedBox.shrink());
            },
          ),
        ),
      ),
    );
  }
}
