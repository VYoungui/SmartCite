import 'package:flutter/material.dart';
import 'package:smart_cite/src/core/theme/dimens.dart';
import 'package:smart_cite/src/feature/signalement/model/problems_model.dart';
import 'package:smart_cite/src/shared/enum/inputfield_style.dart';
import 'package:smart_cite/src/shared/widgets/fields/input_text_field.dart';

import '../../../shared/enum/button_style.dart';
import '../../../shared/widgets/buttons/validated_button.dart';

class ReportingDetails extends StatelessWidget {
  final Problems problems;
  const ReportingDetails({super.key, required this.problems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 346,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/empty.jpg'))),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: Dimens.padding,
              right: Dimens.padding
            ),
            child: Expanded(
                child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Insalubrité'), Text('En attente')],
                ),
                Text('Dimanche, 12 Juin'),
                SizedBox(
                  height: Dimens.doublePadding,
                ),
                Text('Description...'),
                Text('Localisation...'),
                InputTextField(
                    align: TextAlign.start,
                    controller: TextEditingController(),
                    enabled: true,
                    onChanged: (p0) {},
                    validator: (p0) {
                      return '';
                    },
                    obscureText: false,
                    title: '',
                    inputFieldStyle: InputFieldStyle.profile),
                ValidatedButton(
                    title: 'Modifier',
                    onPressed: () {},
                    buttonStyle: ValidatedButtonStyle.valid,
                    width: MediaQuery.of(context).size.width),
              ],
            )),
          )
        ],
      ),
    );
  }
}
