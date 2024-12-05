import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
    final themePv = ref.watch(themeProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.9,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (deviceType == DeviceType.mobile)
                    Text(
                      'Tues, Nov 12',
                      style: textTheme.bodyMedium?.copyWith(
                        color: CustomColors.neutral[500],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          //ref.read(themeProvider.notifier).toggleTheme();
                          context.push('/home/activities/notifications');
                        },
                        child: Image.asset(
                          color: themePv ? Colors.white : Colors.black,
                          'assets/images/icons/bell.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          context.push('/home/activities/profile');
                        },
                        child: const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/profile.png'),
                          radius: 14,
                          backgroundColor: Colors.yellow,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        Text('This week in Estepona',
            style: textTheme.displaySmall
                ?.copyWith(fontWeight: FontWeight.w500, fontSize: 20)),
        SizedBox(
          height: size.height * 0.018,
        )
      ],
    );
  }
}
