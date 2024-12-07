import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:town_square/presentation/shared/providers/device_type_provider.dart';
import 'package:town_square/presentation/shared/providers/theme_provider.dart';

class NotificationProfileWidget extends ConsumerWidget {
  const NotificationProfileWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themePv = ref.watch(themeProvider);
    final deviceType = ref.watch(deviceTypeProvider);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            deviceType == DeviceType.mobile
                ? context.go('/activities/notifications')
                : context.go('/discovery/notifications');
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
            deviceType == DeviceType.mobile
                ? context.go('/activities/profile')
                : context.go('/discovery/profile');
          },
          child: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.png'),
            radius: 15,
            backgroundColor: Colors.yellow,
          ),
        ),
      ],
    );
  }
}
