import 'package:flutter/material.dart';
import 'package:town_square/config/theme/custom_colors.dart';

class PersonalCalendarWidget extends StatelessWidget {
  const PersonalCalendarWidget({super.key, required this.isDark});
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
          color: isDark ? CustomColors.neutral[900] : const Color(0xFFE9ECEF),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 5,
            ),
            CircleAvatar(
              backgroundColor: CustomColors.primary[300],
              radius: 8,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Personal Calendar',
              style: textTheme.bodyMedium?.copyWith(
                  color: isDark
                      ? CustomColors.neutral[500]
                      : CustomColors.neutral[600]),
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(Icons.keyboard_arrow_down_rounded),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
      ),
    );
  }
}
