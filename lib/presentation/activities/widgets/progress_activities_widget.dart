import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:town_square/config/theme/custom_colors.dart';
import 'package:town_square/presentation/shared/providers/device_type_provider.dart';

class ProgressActivitiesWidget extends ConsumerWidget {
  const ProgressActivitiesWidget({super.key, required this.value});
  final int value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);
    final deviceType = ref.watch(deviceTypeProvider);
    final widthHeight =
        deviceType == DeviceType.mobile ? size.width * 0.15 : size.width * 0.04;
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: widthHeight,
          height: widthHeight,
          child: CircularProgressIndicator(
            color: CustomColors.primary[400],
            value: 1 - (value / 100),
            strokeWidth: 5,
            backgroundColor: Colors.white,
          ),
        ),
        Text(value.toString(),
            style: textTheme.displayLarge
                ?.copyWith(color: Colors.black, fontSize: 25)),
      ],
    );
  }
}
