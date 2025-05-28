import 'package:flutter/material.dart';

import '../../../core/theme/dimens.dart';

typedef VoidString = Function(String);
typedef StringVoidString = String? Function(String?);

class InputTextField extends StatelessWidget {
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
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: Dimens.space/2,
          bottom: Dimens.space/2,
          left: Dimens.padding,
          right: Dimens.padding
      ),
      child: TextFormField(
        enabled: enabled,
        textAlign: align,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 12
        ),
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.halfRadius),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onSurface,
                style: BorderStyle.solid
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.halfRadius),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onSurface,
                style: BorderStyle.solid,
                width: 1
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.halfRadius),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onSurface,
                style: BorderStyle.solid,
                width: 1
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.halfRadius),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onSurface,
                style: BorderStyle.solid,
                width: 1
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: label,
          prefixIcon: prefix,
          suffixIcon: suffix,
          labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
