import 'package:flutter/material.dart';
import 'package:town_square/config/theme/custom_colors.dart';

import 'package:town_square/infrastructure/constants/data.dart';

class CategoryItemWidget extends StatelessWidget {
  final ActivityCategory category;
  final bool isSelected;
  final void Function() onPressed;

  const CategoryItemWidget({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final boxDecoration = BoxDecoration(
      color: isSelected
          ? CustomColors.secondaryB[400]
          : CustomColors.secondaryB[200],
      borderRadius: BorderRadius.circular(4),
    );

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        decoration: boxDecoration,
        child: Text(
          category.displayName,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
