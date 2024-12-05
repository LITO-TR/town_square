import 'package:flutter/material.dart';

class OrganizedAssistedWidget extends StatelessWidget {
  const OrganizedAssistedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              '15',
              style: textTheme.titleMedium,
            ),
            Text(
              'Organized',
              style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),
            )
          ],
        ),
        Container(
          height: size.height * 0.06,
          width: 1,
          color: const Color(0xFFEBEEF2),
        ),
        Column(
          children: [
            Text(
              '20',
              style: textTheme.titleMedium,
            ),
            Text(
              'Assisted',
              style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),
            )
          ],
        ),
      ],
    );
  }
}
