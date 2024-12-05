import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:town_square/config/theme/custom_colors.dart';
import 'package:town_square/domain/entities/activity_entity.dart';

import 'package:town_square/presentation/shared/providers/device_type_provider.dart';
import 'package:town_square/presentation/shared/providers/theme_provider.dart';

class MyEventItem extends ConsumerWidget {
  const MyEventItem({
    super.key,
    required this.activity,
  });
  final ActivityEntity activity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);
    final themePv = ref.watch(themeProvider);
    final deviceType = ref.watch(deviceTypeProvider);
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Container(
        decoration: BoxDecoration(
          color: themePv
              ? CustomColors.scaffoldBackgroundColorDarkMode
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border:
              themePv ? Border.all(color: CustomColors.neutral[600]!) : null,
          boxShadow: const [
            BoxShadow(
              color: Color(0x1F000000),
              offset: Offset(3, 3),
              blurRadius: 8,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        activity.date,
                        style: textTheme.bodySmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      Text(
                        " (${activity.duration})",
                        style: textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF9E9E9E),
                        ),
                      ),
                    ],
                  ),
                  Text(activity.title,
                      style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 16)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        size: 12,
                        Icons.location_on_outlined,
                        color: CustomColors.neutral,
                      ),
                      Text(
                        activity.location,
                        style: textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF9E9E9E),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    activity.price == 0
                        ? "Free"
                        : "${activity.price.toInt()}€${activity.isHourly ? '/hour' : ''}",
                    style: textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  SizedBox(
                    height: size.height * 0.004,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.primary[300],
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0),
                      minimumSize: const Size(0, 20),
                      disabledBackgroundColor: CustomColors.neutral,
                      disabledForegroundColor: Colors.white,
                    ),
                    onPressed: () {
                      if (deviceType == DeviceType.mobile) {
                        context.push(
                          '/home/activities/details',
                          extra: {'activity': activity},
                        );
                      } else {}
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                      child: Text(
                        "See more",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
