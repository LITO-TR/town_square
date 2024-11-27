import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:town_square/config/theme/custom_colors.dart';
import 'package:town_square/domain/activity_entity.dart';
import 'package:town_square/presentation/activities/widgets/custom_button_join_widget.dart';
import 'package:town_square/presentation/shared/providers/theme_provider.dart';

class ActivityCardWidget extends ConsumerWidget {
  final ActivityEntity activity;

  const ActivityCardWidget({super.key, required this.activity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);
    final themePv = ref.watch(themeProvider);

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
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: CustomColors.neutral[200],
                        ),
                        child: Text(
                          "${activity.availableSpots} spots left",
                          style: textTheme.bodySmall?.copyWith(
                              color: CustomColors.neutral,
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
                      onPressed: () {},
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                        child: Text("Sold out"),
                      ),
                    ),
                  if (activity.availableSpots > 0)
                    CustomButtonJoinWidget(
                      isDark: themePv,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getServiceWidget(String service, TextTheme textTheme) {
    final Map<String, Color> serviceColors = {
      'light': CustomColors.lightIntensity,
      'medium': CustomColors.mediumIntensity,
      'high': CustomColors.highIntensity,
      'veryHighIntensity': CustomColors.veryHighIntensity,
      'workspace': CustomColors.workSpaceTag,
      'childcare': CustomColors.childCareTag,
    };
    final Map<String, Color> titleServiceColors = {
      'light': CustomColors.lightIntensityTitle,
      'medium': CustomColors.mediumIntensityTitle,
      'high': CustomColors.highIntensityTitle,
      'veryHighIntensity': CustomColors.veryHighIntensityTitle,
      'workspace': CustomColors.workSpaceTagTitle,
      'childcare': CustomColors.childCareTagTitle,
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: serviceColors[service] ?? CustomColors.neutral[200],
      ),
      child: Text(
        service,
        style: textTheme.bodySmall?.copyWith(
            color: titleServiceColors[service],
            fontWeight: FontWeight.w700,
            fontSize: 10),
      ),
    );
  }
}
