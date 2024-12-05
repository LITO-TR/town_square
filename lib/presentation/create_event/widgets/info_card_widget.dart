import 'package:flutter/material.dart';
import 'package:town_square/config/theme/custom_colors.dart';

class InfoCardWidget extends StatelessWidget {
  const InfoCardWidget(
      {super.key,
      this.icon,
      this.imagePath,
      required this.title,
      this.subtitle,
      required this.textTheme,
      this.iconEnd,
      required this.isDark});
  final IconData? icon;
  final String? imagePath;
  final String title;
  final String? subtitle;
  final TextTheme textTheme;
  final IconData? iconEnd;
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isDark ? CustomColors.neutral[900] : Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x1F000000),
            offset: Offset(3, 3),
            blurRadius: 8,
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 10),
            if (icon != null)
              Icon(icon, color: CustomColors.neutral[600])
            else if (imagePath != null)
              Image.asset(
                imagePath ?? '',
                width: 20,
                height: 20,
                color: isDark
                    ? CustomColors.neutral[500]
                    : CustomColors.neutral[600],
              ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.bodyLarge?.copyWith(
                    fontSize: 16,
                    color: isDark
                        ? CustomColors.neutral[500]
                        : CustomColors.neutral[600],
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle ?? '',
                    style: textTheme.bodySmall?.copyWith(
                      color: isDark
                          ? CustomColors.neutral[500]
                          : CustomColors.neutral[600],
                    ),
                  ),
              ],
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.1,
            ),
            Icon(
              iconEnd,
              color: isDark
                  ? CustomColors.neutral[500]
                  : CustomColors.neutral[600],
            )
          ],
        ),
      ),
    );
  }
}
