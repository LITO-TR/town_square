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
            icon: Icon(
              Icons.calendar_today_outlined,
              color: isDark ? Colors.white : Colors.black,
            ),
            label: 'Calendar',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.map_outlined,
              color: isDark ? Colors.white : Colors.black,
            ),
            label: 'Map',
          ),
          NavigationDestination(
            icon: Container(
              decoration: BoxDecoration(
                color:
                    isDark ? CustomColors.primary : CustomColors.primary[200],
                shape: BoxShape.circle,
                border: Border.all(
                  color: isDark
                      ? CustomColors.primary
                      : CustomColors.primary[200]!,
                  width: 12,
                ),
              ),
              child: const Icon(
                Icons.add,
                size: 24,
                color: Colors.black,
              ),
            ),
            label: 'Plus',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.people_alt_outlined,
              color: isDark ? Colors.white : Colors.black,
            ),
            label: 'Users',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.star_outline_outlined,
              color: isDark ? Colors.white : Colors.black,
            ),
            label: 'Star',
          ),
        ],
      ),
    );
  }
}
