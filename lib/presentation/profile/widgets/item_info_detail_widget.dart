import 'package:flutter/material.dart';
import 'package:town_square/config/theme/custom_colors.dart';

class ItemInfoDetailWidget extends StatelessWidget {
  const ItemInfoDetailWidget(
      {super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Icon(icon, color: CustomColors.neutral[600]),
        Text(
          title,
          style:
              textTheme.bodyMedium?.copyWith(color: CustomColors.neutral[600]),
        ),
      ],
    );
  }
}
