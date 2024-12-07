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
import 'package:town_square/presentation/shared/providers/device_type_provider.dart';
import 'package:town_square/presentation/shared/screens/home_screen.dart';
import 'package:town_square/presentation/shared/screens/scaffold_with_nested_navigation.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKeys = List.generate(
    6, (index) => GlobalKey<NavigatorState>(debugLabel: 'shell$index'));

final goRouterProvider = Provider<GoRouter>((ref) {
  final goRouterNotifier = ref.read(goRouterNotifierProvider);
  final deviceType = ref.watch(deviceTypeProvider);

  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation:
        deviceType == DeviceType.mobile ? '/activities' : '/discovery',
    navigatorKey: _rootNavigatorKey,
    refreshListenable: goRouterNotifier,
    routes: _buildRoutes(deviceType),
  );
});

List<RouteBase> _buildRoutes(DeviceType deviceType) {
  if (isMobileDevice(deviceType)) {
    return _buildMobileRoutes();
  } else {
    return _buildDesktopRoutes();
  }
}

List<RouteBase> _buildMobileRoutes() {
  return [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(
          key: state.pageKey,
          navigationShell: navigationShell,
        );
      },
      branches: List.generate(6, (index) => _buildShellBranch(index)),
    ),
    GoRoute(
      path: "/details",
      pageBuilder: (context, state) {
        final activity = state.extra as ActivityEntity;
        return buildCustomTransitionPage(
          context: context,
          child: ActivityDetailScreen(activity: activity),
        );
      },
    ),
  ];
}

List<RouteBase> _buildDesktopRoutes() {
  return [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(
          key: state.pageKey,
          navigationShell: navigationShell,
        );
      },
      branches: List.generate(6, (index) => _buildDesktopShellBranch(index)),
    ),
  ];
}

StatefulShellBranch _buildShellBranch(int index) {
  final paths = [
    "/activities",
    "/map",
    "/create-event",
    "/people",
    "/star",
    "/settings"
  ];
  final widgets = [
    const ActivitiesView(),
    const Center(child: Text('Map')),
    const CreateEventScreen(),
    const Center(child: Text('People')),
    const Center(child: Text('Star')),
    const Center(child: Text('Settings')),
  ];

  return StatefulShellBranch(
    navigatorKey: _shellNavigatorKeys[index],
    routes: [
      GoRoute(
        path: paths[index],
        pageBuilder: (context, state) {
          return buildCustomTransitionPage(
            child: widgets[index],
            context: context,
          );
        },
        routes: _buildSubRoutes(index),
      ),
    ],
  );
}

List<GoRoute> _buildSubRoutes(int index) {
  switch (index) {
    case 0:
      return [
        GoRoute(
          path: "notifications",
          pageBuilder: (context, state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: const NotificationsView(),
            );
          },
        ),
        GoRoute(
          path: "profile",
          pageBuilder: (context, state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: const ProfileView(),
            );
          },
        ),
      ];
    case 1:
      return [
        GoRoute(
          path: "details",
          pageBuilder: (context, state) {
            final activity = state.extra as ActivityEntity;
            return buildCustomTransitionPage(
              context: context,
              child: ActivityDetailScreen(activity: activity),
            );
          },
        ),
      ];
    default:
      return [];
  }
}

StatefulShellBranch _buildDesktopShellBranch(int index) {
  final paths = [
    "/discovery",
    "/people",
    "/job-board",
    "/local-marketplace",
    "/request-to-create",
    "/settings"
  ];
  final widgets = [
    const ActivitiesView(),
    const Center(child: Text('People')),
    const Center(child: Text('Job Board')),
    const Center(child: Text('Local Marketplace')),
    const CreateEventScreen(),
    const Center(child: Text('Settings')),
  ];

  return StatefulShellBranch(
    navigatorKey: _shellNavigatorKeys[index],
    routes: [
      GoRoute(
        path: paths[index],
        pageBuilder: (context, state) {
          return buildCustomTransitionPage(
            //key: state.pageKey,
            child: widgets[index], context: context,
          );
        },
        routes: _buildDesktopSubRoutes(index),
      ),
    ],
  );
}

List<GoRoute> _buildDesktopSubRoutes(int index) {
  switch (index) {
    case 0:
      return [
        GoRoute(
          path: "notifications",
          pageBuilder: (context, state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: const NotificationsView(),
            );
          },
        ),
        GoRoute(
          path: "profile",
          pageBuilder: (context, state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: const ProfileView(),
            );
          },
        ),
      ];

    default:
      return [];
  }
}

bool isMobileDevice(DeviceType deviceType) {
  return deviceType == DeviceType.mobile;
}

CustomTransitionPage<T> buildCustomTransitionPage<T>({
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

List<HomeItem> itemsMobile = [
  HomeItem(name: 'Actividades', iconPath: 'assets/images/icons/calendar.png'),
  HomeItem(name: 'Mapa', iconPath: 'assets/images/icons/map.png'),
  HomeItem(name: 'Crear evento', iconPath: 'assets/images/icons/plus.png'),
  HomeItem(name: 'Personas', iconPath: 'assets/images/icons/users.png'),
  HomeItem(name: 'Star', iconPath: 'assets/images/icons/star.png'),
];

List<HomeItem> itemsDesktop = [
  HomeItem(name: 'Discovery', iconPath: 'assets/images/icons/calendar.png'),
  HomeItem(name: 'People', iconPath: 'assets/images/icons/users.png'),
  HomeItem(name: 'Job Board', iconPath: 'assets/images/icons/calendar.png'),
  HomeItem(
      name: 'Local\nMarketPlace',
      iconPath: 'assets/images/icons/marketplace.png'),
  HomeItem(
      name: 'Request to\nCreate ', iconPath: 'assets/images/icons/plus.png'),
  HomeItem(name: 'Settings', iconPath: 'assets/images/icons/settings.png'),
];
