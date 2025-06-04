import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_cite/src/shared/enum/inputfield_style.dart';

import '../../../core/theme/dimens.dart';

typedef VoidString = Function(String);
typedef StringVoidString = String? Function(String?);

class InputTextField extends StatelessWidget {
  final InputFieldStyle inputFieldStyle;
  final String title;
  final String? label;
  final Widget? prefix;
  final Widget? suffix;
  final TextAlign align;
  final TextEditingController controller;
  final bool enabled;
  final VoidString onChanged;
  final StringVoidString validator;
  final bool obscureText;
  const InputTextField(
      {super.key,
      this.label,
      this.prefix,
      this.suffix,
      required this.align,
      required this.controller,
      required this.enabled,
      required this.onChanged,
      required this.validator,
      required this.obscureText,
      required this.title,
      required this.inputFieldStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(
          top: Dimens.space / 2,
          bottom: Dimens.space / 2,
          left: Dimens.padding,
          right: Dimens.padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
              visible: inputFieldStyle == InputFieldStyle.input ? true : false,
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              )),
          const SizedBox(
            height: Dimens.minPadding,
          ),
          SizedBox(
            height: 56,
            width: MediaQuery.sizeOf(context).width,
            child: TextFormField(
              enabled: enabled,
              textAlign: align,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
              onEditingComplete: () {
                FocusScope.of(context).nextFocus();
              },
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              obscureText: obscureText,
              onChanged: onChanged,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validator,
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: inputFieldStyle == InputFieldStyle.input
                    ? Theme.of(context).colorScheme.surface
                    : Theme.of(context).colorScheme.onSurface.withAlpha(25),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimens.halfRadius),
                  borderSide: BorderSide(
                      color: inputFieldStyle == InputFieldStyle.input
                          ? Theme.of(context).colorScheme.onSurface
                          : Colors.transparent,
                      style: inputFieldStyle == InputFieldStyle.input
                          ? BorderStyle.solid
                          : BorderStyle.none),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimens.halfRadius),
                  borderSide: BorderSide(
                      color: inputFieldStyle == InputFieldStyle.input
                          ? Theme.of(context).colorScheme.onSurface
                          : Colors.transparent,
                      style: inputFieldStyle == InputFieldStyle.input
                          ? BorderStyle.solid
                          : BorderStyle.none),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimens.halfRadius),
                  borderSide: BorderSide(
                      color: inputFieldStyle == InputFieldStyle.input
                          ? Theme.of(context).colorScheme.onSurface
                          : Colors.transparent,
                      style: inputFieldStyle == InputFieldStyle.input
                          ? BorderStyle.solid
                          : BorderStyle.none),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimens.halfRadius),
                  borderSide: BorderSide(
                      color: inputFieldStyle == InputFieldStyle.input
                          ? Theme.of(context).colorScheme.onSurface
                          : Colors.transparent,
                      style: inputFieldStyle == InputFieldStyle.input
                          ? BorderStyle.solid
                          : BorderStyle.none),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimens.halfRadius),
                  borderSide: BorderSide(
                      color: inputFieldStyle == InputFieldStyle.input
                          ? Theme.of(context).colorScheme.onSurface
                          : Colors.transparent,
                      style: inputFieldStyle == InputFieldStyle.input
                          ? BorderStyle.solid
                          : BorderStyle.none),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: label,
                hintText: inputFieldStyle == InputFieldStyle.search
                    ? 'Rechercher un problème' : '',
                hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(75),
                ),
                prefixIcon: inputFieldStyle == InputFieldStyle.search
                    ? Icon(
                  Iconsax.search_normal,
                  color:
                  Theme.of(context).colorScheme.onSurface.withAlpha(75),
                )
                    : prefix,
                suffixIcon: suffix,
                labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
