import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:town_square/presentation/shared/providers/device_type_provider.dart';

class OrganizedAssistedWidget extends ConsumerWidget {
  const OrganizedAssistedWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;
    final deviceType = ref.watch(deviceTypeProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (deviceType == DeviceType.desktop)
          Column(
            children: [
              Text(
                '15',
                style: textTheme.titleMedium,
              ),
              Text(
                'Organized',
                style:
                    textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        if (deviceType == DeviceType.desktop)
          Container(
            height: size.height * 0.06,
            width: 1,
            color: const Color(0xFFEBEEF2),
          ),
        Column(
          children: [
            Text(
              '15',
              style: textTheme.titleMedium,
            ),
            Text(
              'Organized',
              style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Container(
          height: size.height * 0.06,
          width: 1,
          color: const Color(0xFFEBEEF2),
        ),
        Column(
          children: [
            Text(
              '20',
              style: textTheme.titleMedium,
            ),
            Text(
              'Assisted',
              style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),
            )
          ],
        ),
      ],
    );
  }
}
