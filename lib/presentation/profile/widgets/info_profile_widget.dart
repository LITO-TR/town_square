import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:town_square/config/theme/custom_colors.dart';
import 'package:town_square/presentation/profile/widgets/organized_assisted_widget.dart';
import 'package:town_square/presentation/shared/providers/device_type_provider.dart';

class InfoProfileWidget extends ConsumerWidget {
  const InfoProfileWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;
    final deviceType = ref.watch(deviceTypeProvider);

    return deviceType == DeviceType.mobile
        ? Column(
            children: [
              const CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                'Natalia Barajas',
                style: textTheme.titleMedium?.copyWith(fontSize: 22),
              ),
              SizedBox(
                height: size.height * 0.005,
              ),
              Text(
                'Status: Mayor 👑',
                style: textTheme.bodySmall?.copyWith(
                  fontSize: 14,
                  color: CustomColors.neutral[600],
                ),
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                radius: 74,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Natalia Barajas',
                    style: textTheme.titleMedium
                        ?.copyWith(fontSize: 32, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  Text(
                    'Status: Mayor 👑',
                    style: textTheme.bodySmall?.copyWith(
                      fontSize: 16,
                      color: CustomColors.neutral[600],
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  SizedBox(
                      width: size.width * 0.3,
                      child: const OrganizedAssistedWidget()),
                ],
              ),
            ],
          );
  }
}
