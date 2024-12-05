import 'package:flutter/material.dart';

import 'package:town_square/infrastructure/constants/data.dart';
import 'package:town_square/presentation/profile/widgets/interests_widget.dart';
import 'package:town_square/presentation/profile/widgets/item_info_detail_widget.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.description,
            style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          ItemInfoDetailWidget(
            title: ' ${user.location}',
            icon: Icons.location_on_outlined,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          ItemInfoDetailWidget(
            title: ' ${user.occupation}',
            icon: Icons.work_outline_rounded,
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Text(
            'Interests',
            style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          const InterestsWidget()
        ],
      ),
    );
  }
}
