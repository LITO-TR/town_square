import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:town_square/config/helper/top_indicator.dart';
import 'package:town_square/config/theme/custom_colors.dart';

import 'package:town_square/presentation/activities/providers/activities_provider.dart';
import 'package:town_square/presentation/activities/views/activities_view.dart';
import 'package:town_square/presentation/shared/providers/theme_provider.dart';
import 'package:town_square/presentation/shared/providers/device_type_provider.dart';

import 'package:town_square/presentation/shared/widgets/sidebar_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({
    super.key,
  });
  //final StatefulNavigationShell navigationShell;

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(_tabChangeListener);

    Future.microtask(() {
      ref.read(activitiesProvider.notifier).getActivities();
    });
  }

  void _tabChangeListener() {
    setState(() {});
  }

  void _goBranch(int index) {
    // widget.navigationShell.goBranch(
    //   index,
    //   initialLocation: index == widget.navigationShell.currentIndex,
    // );
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

    return Scaffold(
      extendBody: true,
      body: Row(
        children: [
          if (deviceType == DeviceType.desktop)
            SidebarWidget(
              goBranch: _goBranch,
              themePv: themePv,
            ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                ActivitiesView(),
                SizedBox(),
                SizedBox(),
                SizedBox(),
                SizedBox(),
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
                  controller: _tabController,
                  indicator: TopIndicator(),
                  tabs: [
                    Tab(
                      icon: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: _tabController.index == 0
                                ? CustomColors.neutral[200]!
                                : Colors.white),
                        child: Tab(
                          icon: Image.asset(
                            'assets/images/icons/calendar.png',
                            width: 24,
                            height: 24,
                            color: _tabController.index == 0
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
                            color: _tabController.index == 1
                                ? CustomColors.neutral[300]!
                                : Colors.white),
                        child: Image.asset(
                          'assets/images/icons/map.png',
                          width: 24,
                          height: 24,
                          color: _tabController.index == 1
                              ? CustomColors.primary[400]
                              : (isDark ? Colors.white : Colors.black),
                        ),
                      ),
                    ),
                    Tab(
                      icon: Container(
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
                    Tab(
                      icon: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: _tabController.index == 3
                                ? CustomColors.neutral[300]!
                                : Colors.white),
                        child: Image.asset(
                          'assets/images/icons/users.png',
                          width: 24,
                          height: 24,
                          color: _tabController.index == 3
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
                            color: _tabController.index == 4
                                ? CustomColors.neutral[300]!
                                : Colors.white),
                        child: Image.asset(
                          'assets/images/icons/star.png',
                          width: 24,
                          height: 24,
                          color: _tabController.index == 4
                              ? CustomColors.primary
                              : (isDark ? Colors.white : Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          : null,
    );
  }
}
