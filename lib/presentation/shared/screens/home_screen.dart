import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:town_square/presentation/activities/providers/activities_provider.dart';
import 'package:town_square/presentation/shared/providers/theme_provider.dart';
import 'package:town_square/presentation/shared/providers/device_type_provider.dart';
import 'package:town_square/presentation/shared/widgets/custom_navigation_bar_widget.dart';
import 'package:town_square/presentation/shared/widgets/sidebar_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(activitiesProvider.notifier).getActivities();
    });
  }

  int _selectedIndex = 0;
  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
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
            child: widget.navigationShell,
          ),
        ],
      ),
      bottomNavigationBar: deviceType == DeviceType.mobile
          ? CustomNavigationBarWidget(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
                _goBranch(_selectedIndex);
              },
              isDark: isDark,
            )
          : null,
    );
  }
}
