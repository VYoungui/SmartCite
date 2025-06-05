import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_cite/src/core/theme/dimens.dart';
import 'package:smart_cite/src/feature/auth/logic/auth_cubit.dart';
import 'package:smart_cite/src/feature/dto/request/login_request.dart';
import 'package:smart_cite/src/feature/dto/request/register_request.dart';
import 'package:smart_cite/src/shared/enum/button_style.dart';
import 'package:smart_cite/src/shared/widgets/buttons/validated_button.dart';

import '../../../shared/enum/inputfield_style.dart';
import '../../../shared/widgets/fields/input_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController townController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  bool obscure = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (message) {
              Navigator.of(context).pop();
              var snackBar = SnackBar(
                content: Text(message,
                    style: GoogleFonts.poppins(
                        color: Theme.of(context).colorScheme.error)),
                backgroundColor: Theme.of(context).colorScheme.onError,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            loading: () {
              Future<void> showMyDialog() async {
                return showDialog<void>(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return const AlertDialog(
                      title: Text('Loading'),
                      content: SingleChildScrollView(
                        child: Center(
                            child: SizedBox(
                          height: 50,
                          width: 50,
                          child: (CircularProgressIndicator()),
                        )),
                      ),
                    );
                  },
                );
              }

              showMyDialog();
            },
            success: (user) {
              if (user.role.length > 6) {
                context.go('/reports');
              } else {
                context.go('/dash');
              }
            },
            orElse: () {},
          );
        },
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          top: Dimens.doublePadding,
                          left: Dimens.doublePadding),
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/logo.jpg'))),
                    ),
                    const SizedBox(
                      height: Dimens.doublePadding,
                    ),
                    TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      tabs: const <Widget>[
                        Tab(text: 'Se Connecter'),
                        Tab(text: 'S\'inscrire')
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: <Widget>[
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: Dimens.doublePadding * 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: Dimens.padding,
                                      right: Dimens.padding),
                                  child: Text(
                                    'Connecte-toi à ton compte',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                                const SizedBox(
                                  height: Dimens.padding,
                                ),
                                Text(
                                  'Entre ton email et ton mot de passe pour te connecter',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface
                                              .withAlpha(75)),
                                ),
                                const SizedBox(
                                  height: Dimens.doublePadding * 2,
                                ),
                                InputTextField(
                                    align: TextAlign.start,
                                    controller: loginEmailController,
                                    enabled: true,
                                    onChanged: (p0) {},
                                    validator: (p0) {
                                      return '';
                                    },
                                    obscureText: false,
                                    title: 'Email',
                                    inputFieldStyle: InputFieldStyle.input),
                                InputTextField(
                                  align: TextAlign.start,
                                  controller: loginPasswordController,
                                  enabled: true,
                                  onChanged: (p0) {},
                                  validator: (p0) {
                                    return '';
                                  },
                                  obscureText: obscure,
                                  title: 'Password',
                                  inputFieldStyle: InputFieldStyle.input,
                                  suffix: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          obscure = false;
                                        });
                                      },
                                      child: const Icon(Iconsax.eye_slash)),
                                ),
                                const SizedBox(
                                  height: Dimens.doublePadding,
                                ),
                                ValidatedButton(
                                    title: 'Se Connecter',
                                    onPressed: () {
                                      context.read<AuthCubit>().login(
                                          LoginRequest(
                                              email: loginEmailController.text,
                                              password: loginPasswordController
                                                  .text));
                                    },
                                    buttonStyle: ValidatedButtonStyle.valid,
                                    width: MediaQuery.of(context).size.width),
                                const SizedBox(
                                  height: Dimens.padding,
                                ),
                                Wrap(
                                  children: [
                                    Text(
                                      'Vous n\'avez pas de compte ? ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSurface
                                                  .withAlpha(75)),
                                    ),
                                    Text(
                                      'Inscrivez-vous',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: Dimens.doublePadding * 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: Dimens.padding,
                                      right: Dimens.padding),
                                  child: Text(
                                    'Inscris-toi et profite de l’app',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                                const SizedBox(
                                  height: Dimens.padding,
                                ),
                                Text(
                                  'Entre tes informations pour t’inscrire',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface
                                              .withAlpha(75)),
                                ),
                                const SizedBox(
                                  height: Dimens.doublePadding * 2,
                                ),
                                InputTextField(
                                    align: TextAlign.start,
                                    controller: nameController,
                                    enabled: true,
                                    onChanged: (p0) {},
                                    validator: (p0) {
                                      return '';
                                    },
                                    obscureText: false,
                                    title: 'Nom',
                                    inputFieldStyle: InputFieldStyle.input),
                                InputTextField(
                                    align: TextAlign.start,
                                    controller: registerEmailController,
                                    enabled: true,
                                    onChanged: (p0) {},
                                    validator: (p0) {
                                      return '';
                                    },
                                    obscureText: false,
                                    title: 'Email',
                                    inputFieldStyle: InputFieldStyle.input),
                                InputTextField(
                                  align: TextAlign.start,
                                  controller: registerPasswordController,
                                  enabled: true,
                                  onChanged: (p0) {},
                                  validator: (p0) {
                                    return '';
                                  },
                                  obscureText: true,
                                  title: 'Password',
                                  inputFieldStyle: InputFieldStyle.input,
                                  suffix: const Icon(Iconsax.eye_slash),
                                ),
                                const SizedBox(
                                  height: Dimens.doublePadding,
                                ),
                                ValidatedButton(
                                    title: 'Se Connecter',
                                    onPressed: () {
                                      print('connect');
                                      context.read<AuthCubit>().register(
                                          RegisterRequest(
                                              full_name: nameController.text,
                                              email:
                                                  registerEmailController.text,
                                              password:
                                                  registerPasswordController
                                                      .text,
                                          ));
                                    },
                                    buttonStyle: ValidatedButtonStyle.valid,
                                    width: MediaQuery.of(context).size.width),
                                const SizedBox(
                                  height: Dimens.padding,
                                ),
                                Wrap(
                                  children: [
                                    Text(
                                      'Déjà un compte ? ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSurface
                                                  .withAlpha(75)),
                                    ),
                                    Text(
                                      'Se connecter',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
