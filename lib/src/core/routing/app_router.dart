import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_cite/src/feature/home_screen/ui/home_screen.dart';
class AppRouter{
  GoRouter getConfig(){
    /// The route configuration.
    final GoRouter router = GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
            //const ShopHomeScreen();
            //const SplashScreen();
          },
        )

      ],
    );
    return router;
  }
}