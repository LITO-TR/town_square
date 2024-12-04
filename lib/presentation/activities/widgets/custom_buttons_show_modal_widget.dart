import 'package:flutter/material.dart';
import 'package:town_square/config/theme/custom_colors.dart';

class CustomButtonsShowModalWidget extends StatelessWidget {
  const CustomButtonsShowModalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size.width * 0.85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: size.width * 0.4,
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
            width: size.width * 0.4,
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
