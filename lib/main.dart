import 'dart:async';

import 'package:flutter/material.dart';

import 'core/app_initializer.dart';
import 'core/application.dart';

void main() {
  final AppInitializer appInitializer = AppInitializer();

  runZonedGuarded(
        () async {
      WidgetsFlutterBinding.ensureInitialized();

      await appInitializer.preAppRun();

      runApp(Application());

      appInitializer.postAppRun();
    },
        (error, stack) {},
  );
}


