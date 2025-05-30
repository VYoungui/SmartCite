import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_cite/src/feature/home_screen/ui/home_screen.dart';
import 'package:smart_cite/src/feature/unboarding_1/ui/unboarding_1_screen.dart';

import '../../feature/get_start_screen/ui/get_start_screen.dart';
import '../../feature/unboarding_2/ui/unboarding_2_screen.dart';

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
            GoRoute(
            path: 'unboarding1',
              builder: (BuildContext context, GoRouterState state) {
                return const Unboarding1Screen();
              },
            ),
            GoRoute(
            path: 'unboarding2',
              builder: (BuildContext context, GoRouterState state) {
                return const Unboarding2Screen();
              },
            ),
          ],
        ),
      ],
    );
    return router;
  }
}