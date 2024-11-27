import 'package:flutter/material.dart';
import 'package:town_square/config/theme/custom_colors.dart';

class CustomNavigationBarWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final bool isDark;

  const CustomNavigationBarWidget({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: const Offset(0, 7.6),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: NavigationBar(
        backgroundColor: isDark ? Colors.black : Colors.white,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        selectedIndex: selectedIndex,
        indicatorColor: Colors.transparent,
        onDestinationSelected: onDestinationSelected,
        destinations: [
          NavigationDestination(
            icon: Image.asset(
              'assets/images/icons/calendar.png',
              width: 24,
              height: 24,
              color: selectedIndex == 0
                  ? CustomColors.primary[400]
                  : (isDark ? Colors.white : Colors.black),
            ),
            label: 'Calendar',
          ),
          NavigationDestination(
            icon: Image.asset(
              'assets/images/icons/map.png',
              width: 24,
              height: 24,
              color: selectedIndex == 1
                  ? CustomColors.primary[400]
                  : (isDark ? Colors.white : Colors.black),
            ),
            label: 'Map',
          ),
          NavigationDestination(
            icon: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Container(
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
              ],
            ),
            label: 'Plus',
          ),
          NavigationDestination(
            icon: Image.asset(
              'assets/images/icons/users.png',
              width: 24,
              height: 24,
              color: selectedIndex == 3
                  ? CustomColors.primary
                  : (isDark ? Colors.white : Colors.black),
            ),
            label: 'Users',
          ),
          NavigationDestination(
            icon: Image.asset(
              'assets/images/icons/star.png',
              width: 24,
              height: 24,
              color: selectedIndex == 4
                  ? CustomColors.primary
                  : (isDark ? Colors.white : Colors.black),
            ),
            label: 'Star',
          ),
        ],
      ),
    );
  }
}
