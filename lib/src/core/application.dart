import 'package:flutter/material.dart';
import 'package:smart_cite/src/core/routing/app_router.dart';
import 'package:smart_cite/src/core/theme/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class Application extends StatelessWidget {
  Application({super.key});

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'SmartCite',
      routerConfig: _router.getConfig(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fr', 'FR'),
      ],
    );
  }
}
