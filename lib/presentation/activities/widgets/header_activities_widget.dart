import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:town_square/config/theme/custom_colors.dart';
import 'package:town_square/presentation/shared/providers/device_type_provider.dart';
import 'package:town_square/presentation/shared/providers/theme_provider.dart';

class HeaderActivitiesWidget extends ConsumerWidget {
  const HeaderActivitiesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);
    final deviceType = ref.watch(deviceTypeProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Tues, Nov 12',
              style: textTheme.bodyMedium?.copyWith(
                  color: CustomColors.neutral, fontWeight: FontWeight.w500),
            ),
            if (deviceType == DeviceType.mobile)
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        ref.read(themeProvider.notifier).toggleTheme();
                      },
                      icon: const Icon(Icons.notifications_none_rounded)),
                  const CircleAvatar(
                    backgroundColor: Colors.yellow,
                  ),
                ],
              )
          ],
        ),
        Column(
          children: [
            Text(
              'This week in Estepona',
              style: textTheme.displayMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.03,
        )
      ],
    );
  }
}
