import 'dart:async';

import 'package:flutter/material.dart';

import 'src/core/app_initializer.dart';
import 'src/core/application.dart';

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


