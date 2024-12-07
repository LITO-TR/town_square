import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:town_square/config/router/app_router_notifier.dart';
import 'package:town_square/domain/entities/activity_entity.dart';
import 'package:town_square/presentation/activities/screen/activity_detail_screen.dart';

import 'package:town_square/presentation/activities/views/activities_view.dart';
import 'package:town_square/presentation/create_event/screens/create_event_screen.dart';
import 'package:town_square/presentation/notifications/view/notifications_view.dart';
import 'package:town_square/presentation/profile/views/profile_view.dart';
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
      child: child,
    ),
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
      initialLocation: '/activities',
      refreshListenable: goRouterNotifier,
      routes: [
        ShellRoute(
          navigatorKey: GlobalKey<NavigatorState>(),
          builder: (context, state, child) {
            return HomeScreen(child: child);
          },
          routes: [
            GoRoute(
              path: "/activities",
              name: "Activities",
              builder: (BuildContext context, GoRouterState state) =>
                  const ActivitiesView(),
              routes: [
                GoRoute(
                  path: "notifications",
                  name: "Notifications",
                  pageBuilder: (BuildContext context, GoRouterState state) =>
                      buildCustomTransitionPage(
                          child: const NotificationsView(), context: context),
                ),
                GoRoute(
                  path: "profile",
                  name: "Profile",
                  pageBuilder: (BuildContext context, GoRouterState state) =>
                      buildCustomTransitionPage(
                          child: const ProfileView(), context: context),
                ),
                GoRoute(
                  path: "create-event",
                  name: "CreateEvent",
                  builder: (BuildContext context, GoRouterState state) =>
                      const CreateEventScreen(),
                ),
              ],
            ),

            // Aquí puedes agregar más rutas según sea necesario
            GoRoute(
              path: "/map",
              name: "Map",
              builder: (BuildContext context, GoRouterState state) =>
                  const Center(
                child: Text('Map'),
              ),
            ),
            GoRoute(
              path: "/people",
              name: "People",
              builder: (BuildContext context, GoRouterState state) =>
                  const Center(
                child: Text('People'),
              ),
            ),
            GoRoute(
              path: "/star",
              name: "Star",
              builder: (BuildContext context, GoRouterState state) =>
                  const Center(
                child: Text('Star'),
              ),
            ),
            GoRoute(
              path: "/jobs",
              name: "Jobs",
              builder: (BuildContext context, GoRouterState state) =>
                  const Center(
                child: Text('Jobs'),
              ),
            ),
            GoRoute(
              path: "/marketplace",
              name: "Marketplace",
              builder: (BuildContext context, GoRouterState state) =>
                  const Center(
                child: Text('Marketplace'),
              ),
            ),
            GoRoute(
              path: "/settings",
              name: "Settings",
              builder: (BuildContext context, GoRouterState state) =>
                  const Center(
                child: Text('Settings'),
              ),
            ),
          ],
        ),
        GoRoute(
          path: "/details",
          name: "Details",
          pageBuilder: (BuildContext context, GoRouterState state) {
            ActivityEntity activity = state.extra as ActivityEntity;

            return buildCustomTransitionPage(
                child: ActivityDetailScreen(
                  activity: activity,
                ),
                context: context);
          },
        ),
      ],
    );
  },
);
