import 'package:keep_fit/app/dependency_injection/dependency_injection.dart';
import 'package:keep_fit/features/articles/presentation/screens/articles_screen.dart';
import 'package:keep_fit/features/auth/presentation/screens/login_screen.dart';
import 'package:keep_fit/features/gyms/presentation/screens/gym_details_screen.dart';
import 'package:keep_fit/features/gyms/presentation/screens/gyms_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keep_fit/features/home/presentation/screens/dashboard_screen.dart';
import 'package:keep_fit/features/map/presentation/screens/map_full_screen.dart';
import 'package:keep_fit/features/settings/presentation/screens/profile_screen.dart';
import 'package:keep_fit/features/settings/presentation/screens/settings_screen.dart';
import 'package:keep_fit/features/splash/presentation/screens/splash_screen.dart';

class Routes {
  /// shared routes
  static const String splashRoute = "/";
  static const String gymsRoute = "gyms";
  static const String gymDetailsRoute = "gym_details";
  static const String mapFullScreenRoute = "map_full_screen";
  static const String loginRoute = "login";
  static const String gymsDashboardRoute = "/gyms_dashboard";
  static const String settingsRoute = "/settings";
  static const String articlesRoute = "/articles";
  static const String profileRoute = "/profile";
}

class RouteGenerator {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellKey = GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: [
      /// shared routes
      GoRoute(
        path: Routes.splashRoute,
        builder: (BuildContext context, GoRouterState state) {
          initSplashModule();
          return const SplashScreen();
        },
        routes: [
          GoRoute(
            path: Routes.gymsRoute,
            builder: (BuildContext context, GoRouterState state) {
              initGymsModule();
              return const GymsScreen(isWithBottomNav: false);
            },
            routes: <GoRoute>[
              GoRoute(
                path: Routes.gymDetailsRoute,
                builder: (BuildContext context, GoRouterState state) {
                  final extra = state.extra as Map<String, dynamic>;
                  final data = extra["data"] as GYMDummyModel;
                  final showLogin = extra["showLogin"] as bool;
                  return GymDetailsScreen(
                    data: data,
                    showLogin: showLogin,
                  );
                },
                routes: <GoRoute>[
                  GoRoute(
                    path: Routes.loginRoute,
                    builder: (BuildContext context, GoRouterState state) =>
                        LoginScreen(
                      data: state.extra as GYMDummyModel,
                    ),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: Routes.mapFullScreenRoute,
            builder: (BuildContext context, GoRouterState state) =>
                MapFullScreen(
              data: state.extra as GYMDummyModel,
            ),
          ),
        ],
      ),

      ShellRoute(
        navigatorKey: _shellKey,
        builder: (context, state, child) => DashboardScreen(child: child),
        routes: <GoRoute>[
          GoRoute(
            parentNavigatorKey: _shellKey,
            path: Routes.gymsDashboardRoute,
            builder: (BuildContext context, GoRouterState state) {
              initGymsModule();
              return const GymsScreen(isWithBottomNav: true);
            },
          ),
          GoRoute(
            parentNavigatorKey: _shellKey,
            path: Routes.articlesRoute,
            builder: (BuildContext context, GoRouterState state) {
              return const ArticlesScreen();
            },
          ),
          GoRoute(
            path: Routes.profileRoute,
            builder: (BuildContext context, GoRouterState state) =>
                const ProfileScreen(),
          ),
          GoRoute(
            parentNavigatorKey: _shellKey,
            path: Routes.settingsRoute,
            builder: (BuildContext context, GoRouterState state) =>
                const SettingsScreen(),
          ),
        ],
      ),
    ],
  );
}
