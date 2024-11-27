import 'package:flutter/material.dart';
import 'package:town_square/config/theme/custom_colors.dart';
import 'package:town_square/presentation/activities/widgets/custom_button_widget.dart';
import 'package:town_square/presentation/activities/widgets/progress_activities_widget.dart';

class CustomCardGoalWidget extends StatelessWidget {
  const CustomCardGoalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.primary[200],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            offset: const Offset(3, 3),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(right: 16.0, left: 16.0, top: 10, bottom: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SizedBox(
                width: size.width * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'You’re close to your goal!',
                      style: textTheme.bodyLarge?.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: size.height * 0.003,
                    ),
                    SizedBox(
                      child: Text(
                        'Join more sport activities to collect more points',
                        style: textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w400, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      children: [
                        CustomButtonWidget(
                          title: 'Join now',
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        CustomButtonWidget(
                          title: 'My points',
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(
            //   width: size.width * 0.05,
            // ),
            const Center(child: ProgressActivitiesWidget(value: 27))
          ],
        ),
      ),
    );
  }
}
