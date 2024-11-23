import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:town_square/config/router/app_router_notifier.dart';
import 'package:town_square/presentation/activities/views/activities_view.dart';
import 'package:town_square/presentation/shared/screens/home_screen.dart';

CustomTransitionPage<T> buildCustomTransitionPage<T>({
  required BuildContext context,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: child),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

final goRouterProvider = Provider(
  (ref) {
    final goRouterNotifier = ref.read(goRouterNotifierProvider);
    final shellNavigatorActivities =
        GlobalKey<NavigatorState>(debugLabel: 'shellActivities');
    final shellNavigatorMap = GlobalKey<NavigatorState>(debugLabel: 'shellMap');
    final shellNavigatorPlus =
        GlobalKey<NavigatorState>(debugLabel: 'shellPlus');
    final shellNavigatorPeople =
        GlobalKey<NavigatorState>(debugLabel: 'shellPeople');
    final shellNavigatorStart =
        GlobalKey<NavigatorState>(debugLabel: 'shellStart');

    return GoRouter(
      initialLocation: '/activities',
      refreshListenable: goRouterNotifier,
      routes: [
        //  shell  navBar
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return HomeScreen(
              navigationShell: navigationShell,
            );
          },
          branches: <StatefulShellBranch>[
            StatefulShellBranch(
                navigatorKey: shellNavigatorActivities,
                routes: [
                  GoRoute(
                    path: "/activities",
                    name: "Activities",
                    pageBuilder: (BuildContext context, GoRouterState state) =>
                        buildCustomTransitionPage(
                      context: context,
                      child: const ActivitiesView(),
                    ),
                  ),
                ]),
            StatefulShellBranch(
              navigatorKey: shellNavigatorMap,
              routes: [
                GoRoute(
                  path: "/locations",
                  name: "Locations",
                  pageBuilder: (BuildContext context, GoRouterState state) =>
                      buildCustomTransitionPage(
                    context: context,
                    child: const Center(
                      child: Text('Locations'),
                    ),
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: shellNavigatorPlus,
              routes: [
                GoRoute(
                  path: "/services",
                  name: "Services",
                  pageBuilder: (BuildContext context, GoRouterState state) =>
                      buildCustomTransitionPage(
                    context: context,
                    child: const Center(
                      child: Text('Services'),
                    ),
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: shellNavigatorPeople,
              routes: [
                GoRoute(
                  path: "/comunities",
                  name: "Comunities",
                  pageBuilder: (BuildContext context, GoRouterState state) =>
                      buildCustomTransitionPage(
                    context: context,
                    child: const Center(
                      child: Text('Comunities'),
                    ),
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: shellNavigatorStart,
              routes: [
                GoRoute(
                  path: "/notifications",
                  name: "Notifications",
                  pageBuilder: (BuildContext context, GoRouterState state) =>
                      buildCustomTransitionPage(
                    context: context,
                    child: const Center(
                      child: Text('Notifications'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  },
);
