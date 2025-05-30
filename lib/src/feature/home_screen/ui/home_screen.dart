import 'package:flutter/material.dart';
import 'package:smart_cite/src/shared/enum/button_style.dart';
import 'package:smart_cite/src/shared/enum/inputfield_style.dart';
import 'package:smart_cite/src/shared/widgets/buttons/validated_button.dart';
import 'package:smart_cite/src/shared/widgets/cards/reporting_card.dart';
import 'package:smart_cite/src/shared/widgets/fields/input_text_field.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();


}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ValidatedButton(title: 'hey', onPressed: () {

            }, buttonStyle: ValidatedButtonStyle.roundedGreen, width: MediaQuery.of(context).size.width,),
            InputTextField(align: TextAlign.start, controller: TextEditingController(), enabled: true, onChanged: (p0) {

            }, validator: (p0) {
              return '';
            }, obscureText: false, title: 'Nom', inputFieldStyle: InputFieldStyle.profile,),
            const SizedBox(
              height: 16,
            ),
            const ReportingCard(image: 'assets/images/ordure.jpg', category: 'Insalubrité', description: 'Ordure non ramassées'),
            Text(
              'SmartCite',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );

  }

}