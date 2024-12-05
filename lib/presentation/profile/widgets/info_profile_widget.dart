import 'package:flutter/material.dart';
import 'package:town_square/config/theme/custom_colors.dart';

class InfoProfileWidget extends StatelessWidget {
  const InfoProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;

    return Column(
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
    );
  }
}
