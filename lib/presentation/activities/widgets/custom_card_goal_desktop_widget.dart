import 'package:flutter/material.dart';
import 'package:town_square/config/theme/custom_colors.dart';
import 'package:town_square/presentation/activities/widgets/custom_button_widget.dart';
import 'package:town_square/presentation/activities/widgets/progress_activities_widget.dart';

class CustomCardGoalDesktopWidget extends StatelessWidget {
  const CustomCardGoalDesktopWidget({super.key});

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
            const EdgeInsets.only(right: 10.0, left: 10.0, top: 14, bottom: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'You’re close to your goal!',
                  style: textTheme.titleLarge
                      ?.copyWith(color: Colors.black, fontSize: 20),
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * 0.15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Complete your weekly challenges and unlock new achievements!',
                            style: textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 12),
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          Row(
                            children: [
                              CustomButtonWidget(
                                title: 'Join now',
                                onPressed: () {},
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              CustomButtonWidget(
                                title: 'My points',
                                onPressed: () {},
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Center(child: ProgressActivitiesWidget(value: 27))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
