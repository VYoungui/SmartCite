import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_cite/src/feature/home_screen/ui/home_screen.dart';

import '../../feature/get_start_screen/ui/get_start_screen.dart';

class AppRouter{
  GoRouter getConfig(){
    /// The route configuration.
    final GoRouter router = GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
          routes: <RouteBase>[
            GoRoute(
            path: 'getStart',
              builder: (BuildContext context, GoRouterState state) {
                return const GetStartScreen();
              },
            ),
          ],
        ),
      ],
    );
    return router;
  }
}