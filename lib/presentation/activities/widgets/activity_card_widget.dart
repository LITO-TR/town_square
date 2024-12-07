import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:town_square/config/helper/get_service_widget.dart';
import 'package:town_square/config/theme/custom_colors.dart';
import 'package:town_square/domain/entities/activity_entity.dart';
import 'package:town_square/presentation/activities/providers/selection_provider.dart';
import 'package:town_square/presentation/activities/widgets/custom_button_join_widget.dart';
import 'package:town_square/presentation/shared/providers/device_type_provider.dart';
import 'package:town_square/presentation/shared/providers/theme_provider.dart';

class ActivityCardWidget extends ConsumerWidget {
  final ActivityEntity activity;

  const ActivityCardWidget({super.key, required this.activity});

  void _openDrawer(BuildContext context, ref) {
    ref.read(selectedActivityProvider.notifier).update((state) => activity);
    Scaffold.of(context).openEndDrawer();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);
    final themePv = ref.watch(themeProvider);
    final deviceType = ref.watch(deviceTypeProvider);

    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  Row(
                    children: [
                      Text(
                        activity.time,
                        style: textTheme.bodySmall,
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
                          fontWeight: FontWeight.w700, fontSize: 18)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        size: 16,
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
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: themePv
                              ? const Color(0xFF6C757D)
                              : CustomColors.neutral[200],
                        ),
                        child: Text(
                          "${activity.availableSpots} spots left",
                          style: textTheme.bodySmall?.copyWith(
                              color: themePv
                                  ? const Color(0xFFE9ECEF)
                                  : CustomColors.neutral,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      ...activity.services.map((service) => Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: getServiceWidget(service, textTheme),
                          )),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    activity.price == 0
                        ? "Free"
                        : "${activity.price.toInt()}€${activity.isHourly ? '/hour' : ''}",
                    style: textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  if (activity.availableSpots == 0)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFDA4AF),
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
                            '/details',
                            extra: activity,
                          );
                        } else {
                          _openDrawer(context, ref);
                        }
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                        child: Text("Sold out"),
                      ),
                    ),
                  if (activity.availableSpots > 0)
                    CustomButtonJoinWidget(
                      isDark: themePv,
                      onPressed: () {
                        if (deviceType == DeviceType.mobile) {
                          context.push(
                            '/details',
                            extra: activity,
                          );
                        } else {
                          _openDrawer(context, ref);
                        }
                      },
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
