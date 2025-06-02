import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/enum/button_style.dart';
import '../../../shared/widgets/buttons/validated_button.dart';


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
            const SizedBox(
              height: 16,
            ),
            Text(
              'SmartCite',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            ValidatedButton(
              title: 'Next',
              onPressed: () {
                context.go('/getStart');
              },
              buttonStyle: ValidatedButtonStyle.valid,
            ),
          ],
        ),
      ),
    );
  }

}