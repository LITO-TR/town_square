import 'package:flutter/material.dart';
import 'package:town_square/config/theme/custom_colors.dart';

class ActivityInformationItemWidget extends StatelessWidget {
  const ActivityInformationItemWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle});
  final IconData icon;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: CustomColors.primary[100],
              borderRadius: BorderRadius.circular(10)),
          child: Icon(
            icon,
            size: 24,
            color: CustomColors.primary,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme.bodyLarge,
            ),
            Text(
              subtitle,
              style: textTheme.bodyMedium
                  ?.copyWith(color: const Color(0xFF747688)),
            ),
          ],
        )
      ],
    );
  }
}
