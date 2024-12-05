import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:town_square/config/helper/top_indicator.dart';
import 'package:town_square/config/theme/custom_colors.dart';

import 'package:town_square/presentation/activities/providers/activities_provider.dart';
import 'package:town_square/presentation/activities/providers/selection_provider.dart';
import 'package:town_square/presentation/activities/views/activities_view.dart';
import 'package:town_square/presentation/create_event/screens/create_event_screen.dart';

import 'package:town_square/presentation/shared/providers/theme_provider.dart';
import 'package:town_square/presentation/shared/providers/device_type_provider.dart';
import 'package:town_square/presentation/shared/widgets/custom_end_drawer_widget.dart';

import 'package:town_square/presentation/shared/widgets/sidebar_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen>
    with TickerProviderStateMixin {
  late TabController _tabControllerMobile;
  late TabController _tabControllerDesktop;

  @override
  void initState() {
    super.initState();
    _tabControllerMobile = TabController(length: 5, vsync: this);
    _tabControllerDesktop = TabController(length: 6, vsync: this);

    _tabControllerMobile.addListener(_tabChangeListener);
    _tabControllerDesktop.addListener(_tabChangeListener);
    Future.microtask(() {
      ref.read(activitiesProvider.notifier).getActivities();
    });
  }

  void _tabChangeListener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final themePv = ref.watch(themeProvider);
    final deviceType = ref.watch(deviceTypeProvider);
    final deviceTypeNotifier = ref.read(deviceTypeProvider.notifier);
    final isDark = themePv;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final width = MediaQuery.of(context).size.width;
      deviceTypeNotifier.updateDeviceType(width);
    });
    final selectedActivity = ref.watch(selectedActivityProvider);

    return Scaffold(
      endDrawer: selectedActivity != null
          ? CustomEndDrawerWidget(activity: selectedActivity)
          : null,
      extendBody: true,
      body: Row(
        children: [
          if (deviceType == DeviceType.desktop)
            SidebarWidget(
              themePv: themePv,
              controller: _tabControllerDesktop,
            ),
          Expanded(
            child: IndexedStack(
              index: deviceType == DeviceType.mobile
                  ? _tabControllerMobile.index
                  : _tabControllerDesktop.index,
              children: [
                widget.child
                // _buildNavigatorWidget(0), // Activities
                // _buildNavigatorWidget(1), // Empty Placeholder
                // _buildNavigatorWidget(2), // Empty Placeholder
                // _buildNavigatorWidget(3), // Empty Placeholder
                // _buildNavigatorWidget(4), // Empty Placeholder
                // _buildNavigatorWidget(5), // Create Event (Desktop only)
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: deviceType == DeviceType.mobile
          ? Material(
              color: isDark ? Colors.black : Colors.white,
              child: SizedBox(
                height: 80,
                child: TabBar(
                  splashFactory: NoSplash.splashFactory,
                  enableFeedback: false,
                  controller: _tabControllerMobile,
                  indicator: TopIndicator(),
                  tabs: [
                    Tab(
                      icon: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: _tabControllerMobile.index == 0
                                ? CustomColors.neutral[200]!
                                : Colors.white),
                        child: Tab(
                          icon: Image.asset(
                            'assets/images/icons/calendar.png',
                            width: 24,
                            height: 24,
                            color: _tabControllerMobile.index == 0
                                ? CustomColors.primary[400]
                                : (isDark ? Colors.white : Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      icon: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: _tabControllerMobile.index == 1
                                ? CustomColors.neutral[300]!
                                : Colors.white),
                        child: Image.asset(
                          'assets/images/icons/map.png',
                          width: 24,
                          height: 24,
                          color: _tabControllerMobile.index == 1
                              ? CustomColors.primary[400]
                              : (isDark ? Colors.white : Colors.black),
                        ),
                      ),
                    ),
                    Tab(
                      icon: GestureDetector(
                        onTap: () {
                          context.push('/home/create-event');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: CustomColors.primary[400],
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: CustomColors.primary[400]!,
                              width: 7,
                            ),
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      icon: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: _tabControllerMobile.index == 3
                                ? CustomColors.neutral[300]!
                                : Colors.white),
                        child: Image.asset(
                          'assets/images/icons/users.png',
                          width: 24,
                          height: 24,
                          color: _tabControllerMobile.index == 3
                              ? CustomColors.primary
                              : (isDark ? Colors.white : Colors.black),
                        ),
                      ),
                    ),
                    Tab(
                      icon: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: _tabControllerMobile.index == 4
                                ? CustomColors.neutral[300]!
                                : Colors.white),
                        child: Image.asset(
                          'assets/images/icons/star.png',
                          width: 24,
                          height: 24,
                          color: _tabControllerMobile.index == 4
                              ? CustomColors.primary
                              : (isDark ? Colors.white : Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }

  // Build a Navigator for each tab
  Widget _buildNavigatorWidget(int index) {
    return Navigator(
      onGenerateRoute: (settings) {
        switch (index) {
          case 0:
            return MaterialPageRoute(
                builder: (context) => const ActivitiesView());
          case 1:
            return MaterialPageRoute(builder: (context) => const SizedBox());
          case 2:
            return MaterialPageRoute(builder: (context) => const SizedBox());
          case 3:
            return MaterialPageRoute(builder: (context) => const SizedBox());
          case 4:
            return MaterialPageRoute(builder: (context) => const SizedBox());
          case 5:
            return MaterialPageRoute(
                builder: (context) => const CreateEventScreen());
          default:
            return MaterialPageRoute(builder: (context) => const SizedBox());
        }
      },
    );
  }
}
