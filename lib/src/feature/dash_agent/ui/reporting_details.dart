import 'package:flutter/material.dart';

import '../../../core/theme/dimens.dart';
import '../../../shared/enum/button_style.dart';
import '../../../shared/enum/inputfield_style.dart';
import '../../../shared/widgets/buttons/validated_button.dart';
import '../../../shared/widgets/fields/input_text_field.dart';

class ReportingDetails extends StatelessWidget {
  const ReportingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 346,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/empty.jpg'))),
          ),
          Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Insalubrité'),
                      Text('En attente')
                    ],
                  ),
                  Text('Dimanche, 12 Juin'),
                  SizedBox(height: Dimens.doublePadding,),
                  Text('Description...'),


                  Text('Localisation...'),
                  InputTextField(align: TextAlign.start, controller: TextEditingController(text: 'Douala, Cameroun'), enabled: true, onChanged: (p0) {

                  }, validator: (p0) {
                    return '';
                  }, obscureText: false, title: '', inputFieldStyle: InputFieldStyle.profile),

                  ValidatedButton(
                      title: 'Marquer en cours',
                      onPressed: () {},
                      buttonStyle: ValidatedButtonStyle.valid,
                      width: MediaQuery.of(context).size.width),

                  ValidatedButton(
                      title: 'Annuler',
                      onPressed: () {},
                      buttonStyle: ValidatedButtonStyle.critic,
                      width: MediaQuery.of(context).size.width),
                ],
              ))
        ],
      ),
    );
  }
}
