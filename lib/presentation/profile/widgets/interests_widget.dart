import 'package:flutter/material.dart';
import 'package:town_square/config/theme/custom_colors.dart';
import 'package:town_square/infrastructure/constants/data.dart';

class InterestsWidget extends StatelessWidget {
  const InterestsWidget({super.key});
  Color _getColorForInterest(String interest) {
    final colors = [
      const Color(0xFF94D7B9),
      const Color(0xFFD98792),
      Colors.orange,
      CustomColors.secondaryB[300]!,
      const Color(0xFFFBD478),
    ];
    return colors[interest.length % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: user.interests.map((interest) {
        final color = _getColorForInterest(interest);
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            interest,
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        );
      }).toList(),
    );
  }
}
