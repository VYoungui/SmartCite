import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_cite/src/core/theme/dimens.dart';
import 'package:smart_cite/src/feature/signalement/logic/reporting_cubit.dart';

import '../../../shared/enum/button_style.dart';
import '../../../shared/enum/inputfield_style.dart';
import '../../../shared/services/image_pick.dart';
import '../../../shared/widgets/buttons/validated_button.dart';
import '../../../shared/widgets/fields/input_text_field.dart';

class CreateReportScreen extends StatefulWidget {
  const CreateReportScreen({super.key});

  @override
  State<CreateReportScreen> createState() => _CreateReportScreenState();
}

class _CreateReportScreenState extends State<CreateReportScreen> {
  final TextEditingController descriptionController = TextEditingController();
  File? image;

  void selectImage() async {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Prendre une photo'),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedImage =
                      await pickImage(source: ImageSource.camera);
                  if (pickedImage != null) {
                    setState(() {
                      image = pickedImage;
                    });
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Depuis la galerie'),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedImage =
                      await pickImage(source: ImageSource.gallery);
                  if (pickedImage != null) {
                    setState(() {
                      image = pickedImage;
                    });
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReportingCubit(),
      child: BlocListener<ReportingCubit, ReportingState>(
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
            success: (reports) => context.go('/reports'),
            orElse: () {},
          );
        },
        child: BlocBuilder<ReportingCubit, ReportingState>(
          builder: (context, state) {
            return Scaffold(
              appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: Padding(
                    padding: const EdgeInsets.all(Dimens.halfPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () => context.go('/reports'),
                            icon: Icon(
                              Iconsax.arrow_left,
                              color: Theme.of(context).colorScheme.onSurface,
                            )),
                      ],
                    ),
                  )),
              body: SafeArea(
                child: Column(
                  children: [
                    Text(
                      'Signale un problème',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: Dimens.padding,
                    ),
                    //Input image
                    GestureDetector(
                      onTap: () { selectImage();},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: Dimens.padding,
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimens.halfRadius),
                                image: const DecorationImage(
                                    image:
                                        AssetImage('assets/images/empty.jpg'))),
                          ),
                          Text(
                            'Importer ici',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(
                            height: Dimens.halfPadding,
                          ),
                          Text(
                            'Une photo décrivant le problème',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withAlpha(75)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: Dimens.doublePadding,
                    ),
                    InputTextField(
                        align: TextAlign.start,
                        controller: TextEditingController(),
                        enabled: true,
                        onChanged: (p0) {},
                        validator: (p0) {
                          return '';
                        },
                        obscureText: false,
                        title: 'Categorie',
                        inputFieldStyle: InputFieldStyle.input),

                    InputTextField(
                        align: TextAlign.start,
                        controller: descriptionController,
                        enabled: true,
                        onChanged: (p0) {},
                        validator: (p0) {
                          return '';
                        },
                        obscureText: false,
                        title: 'Description',
                        inputFieldStyle: InputFieldStyle.input),

                    InputTextField(
                        align: TextAlign.start,
                        controller: TextEditingController(),
                        enabled: true,
                        onChanged: (p0) {},
                        validator: (p0) {
                          return '';
                        },
                        obscureText: false,
                        title: 'Localisation',
                        inputFieldStyle: InputFieldStyle.input),

                    const SizedBox(
                      height: Dimens.doublePadding,
                    ),
                    ValidatedButton(
                        title: 'Valider',
                        onPressed: () {
                          /*
                      context.read<ReportingCubit>().createReport(
                          ProblemsRequest(description: descriptionController.text, image_url: '', localisation: '', status: 'En attente', report_id: , agent_id: null, category_id: category_id), image)

                       */
                        },
                        buttonStyle: ValidatedButtonStyle.valid,
                        width: MediaQuery.of(context).size.width),
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
