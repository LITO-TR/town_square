import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:town_square/config/router/app_router.dart';
import 'package:town_square/presentation/activities/providers/selection_provider.dart';
import 'package:town_square/presentation/shared/providers/device_type_provider.dart';
import 'package:town_square/presentation/shared/widgets/custom_bottom_navigationbar.dart';
import 'package:town_square/presentation/shared/widgets/custom_end_drawer_widget.dart';
import 'package:town_square/presentation/shared/widgets/sidebar_widget.dart';

class HomeScreen extends ConsumerWidget {
  final Widget body;
  final int selectedIndex;
  final Function(WidgetRef, int) onDestinationSelected;
  const HomeScreen({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceType = ref.watch(deviceTypeProvider);
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
              // themePv: themePv,
              items: itemsDesktop,
              onDestinationSelected: onDestinationSelected,
              currentIndex: selectedIndex,
            ),
          Expanded(
            child: body,
          ),
        ],
      ),
      bottomNavigationBar: deviceType == DeviceType.mobile
          ? CustomBottomNavigationbar(
              currentIndex: selectedIndex,
              items: itemsMobile,
              onDestinationSelected: onDestinationSelected,
            )
          : null,
    );
  }
}

class HomeItem {
  final String name;
  final String iconPath;

  HomeItem({
    required this.name,
    required this.iconPath,
  });
}
