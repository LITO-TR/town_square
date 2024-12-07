import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:town_square/config/theme/custom_colors.dart';
import 'package:town_square/presentation/shared/providers/device_type_provider.dart';

class CustomButtonsShowModalWidget extends ConsumerWidget {
  const CustomButtonsShowModalWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final deviceType = ref.watch(deviceTypeProvider);
    return SizedBox(
      width: size.width * 0.85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: deviceType == DeviceType.mobile
                ? size.width * 0.4
                : size.width * 0.2,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Center(
              child: Text(
                "Reset",
                style: TextStyle(color: Color(0xFF6C757D)),
              ),
            ),
          ),
          Container(
            width: deviceType == DeviceType.mobile
                ? size.width * 0.4
                : size.width * 0.2,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: CustomColors.secondaryB[300]!,
              border: Border.all(color: CustomColors.secondaryB[300]!),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Center(
              child: Text(
                'Apply',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
