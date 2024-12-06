import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:town_square/config/theme/custom_colors.dart';
import 'package:town_square/presentation/activities/widgets/activities_list_widget.dart';

import 'package:town_square/presentation/activities/widgets/cetegory_list_widget.dart';
import 'package:town_square/presentation/activities/widgets/custom_card_goal_desktop_widget.dart';
import 'package:town_square/presentation/activities/widgets/custom_card_goal_widget.dart';
import 'package:town_square/presentation/activities/widgets/event_card_widget.dart';
import 'package:town_square/presentation/activities/widgets/header_activities_widget.dart';
import 'package:town_square/presentation/activities/widgets/second_event_card_widget.dart';
import 'package:town_square/presentation/shared/providers/theme_provider.dart';
import 'package:town_square/presentation/shared/widgets/custom_text_form_field_widget.dart';
import 'package:town_square/presentation/shared/providers/device_type_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActivitiesView extends ConsumerWidget {
  const ActivitiesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final deviceType = ref.watch(deviceTypeProvider);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.06),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: HeaderActivitiesWidget(),
                  ),
                  if (deviceType == DeviceType.mobile) ...[
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: CustomCardGoalWidget(),
                    ),
                    SizedBox(height: size.height * 0.03),
                  ],
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
              ),
            ),
            if (deviceType == DeviceType.desktop)
              Expanded(
                flex: 1,
                child: _buildDesktopSideColumn(size, ref, context),
              ),
          ],
        ),
      ),
    );
  }
}

Widget _buildDesktopSideColumn(Size size, WidgetRef ref, BuildContext context) {
  final themePv = ref.watch(themeProvider);
  return SizedBox(
    height: size.height,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.04),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    //ref.read(themeProvider.notifier).toggleTheme();
                    context.push('/activities/notifications');
                  },
                  child: Image.asset(
                    color: themePv ? Colors.white : Colors.black,
                    'assets/images/icons/bell.png',
                    width: 24,
                    height: 24,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    context.go('/activities/profile');
                  },
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.png'),
                    radius: 15,
                    backgroundColor: Colors.yellow,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.025),
          const CustomCardGoalDesktopWidget(),
          SizedBox(height: size.height * 0.03),
          SizedBox(
            height: size.height * 0.21,
            child: const EventCardWidget(),
          ),
          SizedBox(height: size.height * 0.03),
          SizedBox(
              height: size.height * 0.3, child: const SecondEventCardWidget()),
        ],
      ),
    ),
  );
}
