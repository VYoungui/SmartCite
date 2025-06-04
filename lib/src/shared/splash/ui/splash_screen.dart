import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../logic/bootstrap_cubit.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BootstrapCubit()..init(),
      child: BlocListener<BootstrapCubit, BootstrapState>(
        listener: (context, state) {
          state.maybeWhen(
            initialized: (isLoggedIn, role) {
              print(isLoggedIn);
              print(role);
              print(role.length);
              if (isLoggedIn) {
                if(role.length>6){
                  context.go('/reports');
                } else{
                  context.go('/dash');
                }
              } else {
                context.go('/getStart');
              }
            },
            orElse: () {},
          );
        },
        child: Scaffold(
          body: SafeArea(
            child: FractionallySizedBox(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 95,
                    height: 95,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage("assets/images/logo.jpg"))
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}