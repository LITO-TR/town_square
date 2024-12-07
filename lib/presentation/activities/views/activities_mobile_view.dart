import 'package:flutter/material.dart';

import 'package:town_square/config/theme/custom_colors.dart';
import 'package:town_square/presentation/activities/widgets/activities_list_widget.dart';
import 'package:town_square/presentation/activities/widgets/cetegory_list_widget.dart';
import 'package:town_square/presentation/activities/widgets/custom_card_goal_widget.dart';
import 'package:town_square/presentation/activities/widgets/header_activities_widget.dart';
import 'package:town_square/presentation/shared/widgets/custom_text_form_field_widget.dart';

class ActivitiesMobileView extends StatelessWidget {
  const ActivitiesMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height * 0.06),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: HeaderActivitiesWidget(),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomCardGoalWidget(),
        ),
        SizedBox(height: size.height * 0.03),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomTextFormFieldWidget(
            hint: 'What do you feel like doing?',
            suffixIcon: Icon(
              size: 24,
              Icons.search_outlined,
              color: CustomColors.neutral,
            ),
          ),
        ),
        SizedBox(height: size.height * 0.02),
        const Padding(
          padding: EdgeInsets.only(left: 18.0),
          child: CategoryListWidget(
            hideFirstItem: false,
          ),
        ),
        SizedBox(height: size.height * 0.03),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: ActivitiesListWidget(),
        ),
      ],
    );
  }
}
