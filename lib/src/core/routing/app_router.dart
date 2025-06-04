import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_cite/src/feature/auth/ui/login_screen.dart';
import 'package:smart_cite/src/feature/dash_agent/ui/dashboard_agent.dart';
import 'package:smart_cite/src/feature/dash_agent/ui/see_more_reports.dart';
import 'package:smart_cite/src/feature/profile/ui/profile_screen.dart';
import 'package:smart_cite/src/feature/signalement/ui/create_report_screen.dart';
import 'package:smart_cite/src/feature/signalement/ui/reporting_screen.dart';
import 'package:smart_cite/src/feature/unboarding1_screen/ui/unboarding_1_screen.dart';
import 'package:smart_cite/src/shared/splash/ui/splash_screen.dart';

import '../../feature/get_start_screen/ui/get_start_screen.dart';
import '../../feature/unboarding2_screen/ui/unboarding_2_screen.dart';

class AppRouter{
  GoRouter getConfig(){
    /// The route configuration.
    final GoRouter router = GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const SplashScreen();
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
            GoRoute(
              path: 'login',
              builder: (BuildContext context, GoRouterState state) {
                return const LoginScreen();
              },
            ),
            GoRoute(
              path: 'reports',
              builder: (BuildContext context, GoRouterState state) {
                return const ReportingScreen();
              },
            ),
            GoRoute(
              path: 'create-report',
              builder: (BuildContext context, GoRouterState state) {
                return const CreateReportScreen();
              },
            ),
            GoRoute(
              path: 'profile',
              builder: (BuildContext context, GoRouterState state) {
                return const ProfileScreen();
              },
            ),
            GoRoute(
              path: 'dash',
              builder: (BuildContext context, GoRouterState state) {
                return const DashboardAgentScreen();
              },
            ),
            GoRoute(
              path: 'see-more',
              builder: (BuildContext context, GoRouterState state) {
                return const SeeMoreReportsScreen();
              },
            ),
          ],
        ),
      ],
    );
    return router;
  }
}