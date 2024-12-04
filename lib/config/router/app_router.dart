import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:town_square/config/router/app_router_notifier.dart';
import 'package:town_square/domain/activity_entity.dart';
import 'package:town_square/presentation/activities/screen/activity_detail_screen.dart';
import 'package:town_square/presentation/activities/views/activities_view.dart';
import 'package:town_square/presentation/shared/screens/home_screen.dart';

buildCustomTransitionPage<T>({
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

    return GoRouter(
      initialLocation: '/home',
      refreshListenable: goRouterNotifier,
      routes: [
        GoRoute(
          path: "/home",
          name: "Home",
          pageBuilder: (BuildContext context, GoRouterState state) =>
              buildCustomTransitionPage(
                  context: context, child: const HomeScreen()),
        ),
        GoRoute(
          path: "/activities",
          name: "Activities",
          pageBuilder: (BuildContext context, GoRouterState state) =>
              buildCustomTransitionPage(
            context: context,
            child: const ActivitiesView(),
          ),
          routes: [
            GoRoute(
              path: "details",
              name: "ActivityDetails",
              pageBuilder: (BuildContext context, GoRouterState state) {
                final extra = state.extra as Map<String, dynamic>;
                ActivityEntity activity = extra['activity'] as ActivityEntity;

                return buildCustomTransitionPage(
                  context: context,
                  child: ActivityDetailScreen(activity: activity),
                );
              },
            ),
          ],
        ),
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
    );
  },
);
