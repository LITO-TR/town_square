import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:town_square/config/helper/top_indicator.dart';
import 'package:town_square/config/theme/custom_colors.dart';

class SidebarWidget extends ConsumerWidget {
  final bool themePv;
  final TabController controller;

  const SidebarWidget({
    super.key,
    required this.controller,
    required this.themePv,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);

    return Padding(
      padding: const EdgeInsets.only(right: 30.0),
      child: Container(
        width: 272,
        height: size.height,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Image.asset(
              'assets/images/TWNSQR.png',
              width: 156,
              height: 43,
              fit: BoxFit.contain,
            ),
            RotatedBox(
              quarterTurns: 1,
              child: TabBar(
                physics: const NeverScrollableScrollPhysics(),
                dividerColor: Colors.transparent,
                indicator: TopIndicatorDesktop(),
                splashFactory: NoSplash.splashFactory,
                enableFeedback: false,
                controller: controller,
                isScrollable: true,
                tabs: [
                  _buildTabWithLabel(
                    isSelected: controller.index == 0,
                    assetPath: 'assets/images/icons/calendar.png',
                    label: 'Discovery',
                    themePv: themePv,
                    size: size,
                  ),
                  _buildTabWithLabel(
                    isSelected: controller.index == 1,
                    assetPath: 'assets/images/icons/users.png',
                    label: 'People',
                    themePv: themePv,
                    size: size,
                  ),
                  _buildTabWithLabel(
                    isSelected: controller.index == 2,
                    assetPath: 'assets/images/icons/calendar.png',
                    label: 'Job Board',
                    themePv: themePv,
                    size: size,
                  ),
                  _buildTabWithLabel(
                    isSelected: controller.index == 3,
                    assetPath: 'assets/images/icons/marketplace.png',
                    label: 'Local\nMarketplace',
                    themePv: themePv,
                    size: size,
                  ),
                  Tab(
                    height: size.width * 1,
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: Container(
                        width: 210,
                        height: 53,
                        decoration: BoxDecoration(
                          color: CustomColors.primary[300],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const SizedBox(width: 10),
                            Image.asset(
                              'assets/images/icons/plus.png',
                              width: 24,
                              height: 24,
                              color: Colors.black,
                            ),
                            const SizedBox(width: 30),
                            const Text(
                              'Request to\nCreate',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  _buildTabWithLabel(
                    isSelected: controller.index == 5,
                    assetPath: 'assets/images/icons/settings.png',
                    label: 'Settings',
                    themePv: themePv,
                    size: size,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabWithLabel({
    required bool isSelected,
    required String assetPath,
    required String label,
    required bool themePv,
    required size,
  }) {
    final backgroundColor =
        isSelected ? CustomColors.neutral[900] : Colors.black;

    final textColor = isSelected ? CustomColors.primary[400] : Colors.white;

    final iconColor = isSelected ? CustomColors.primary[400] : Colors.white;

    return Tab(
      height: size.width,
      child: RotatedBox(
        quarterTurns: -1,
        child: Container(
          width: 210,
          height: isSelected ? 53 : null,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 10),
              Image.asset(
                assetPath,
                width: 24,
                height: 24,
                color: iconColor,
              ),
              const SizedBox(width: 30),
              Text(
                label,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
