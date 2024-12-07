import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:town_square/config/theme/custom_colors.dart';
import 'package:town_square/presentation/activities/widgets/custom_card_goal_desktop_widget.dart';
import 'package:town_square/presentation/activities/widgets/notification_profile_widget.dart';
import 'package:town_square/presentation/profile/widgets/about_widget.dart';
import 'package:town_square/presentation/profile/widgets/custom_calendar_widget.dart';
import 'package:town_square/presentation/profile/widgets/info_profile_widget.dart';
import 'package:town_square/presentation/profile/widgets/my_events_widgets.dart';
import 'package:town_square/presentation/profile/widgets/reviews_widget.dart';
import 'package:town_square/presentation/shared/providers/theme_provider.dart';

class ProfileDesktopView extends ConsumerStatefulWidget {
  const ProfileDesktopView({super.key});

  @override
  _ProfileDesktopViewState createState() => _ProfileDesktopViewState();
}

class _ProfileDesktopViewState extends ConsumerState<ProfileDesktopView>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isDark = ref.watch(themeProvider);

    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.1),
                const InfoProfileWidget(),
                SizedBox(height: size.height * 0.02),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDark ? Colors.white : Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Edit Profile',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: isDark ? Colors.black : Colors.white,
                            fontSize: 16,
                          ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                _menuBar(context, size, isDark),
                SizedBox(height: size.height * 0.02),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    physics: const ClampingScrollPhysics(),
                    onPageChanged: (int i) {
                      setState(() {
                        selectedIndex = i;
                      });
                    },
                    children: const [
                      AboutWidget(),
                      MyEventsWidgets(),
                      ReviewsWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.06,
                ),
                const NotificationProfileWidget(),
                SizedBox(
                  height: size.height * 0.04,
                ),
                const CustomCardGoalDesktopWidget(),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                    width: size.width * 0.3,
                    decoration: BoxDecoration(
                        color: CustomColors.neutral[900],
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.only(bottom: 20),
                    child: const CustomCalendarWidget()),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  width: size.width * 0.3,
                  height: size.height * 0.25,
                  decoration: BoxDecoration(
                      color: CustomColors.neutral[900],
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildRow(
                          context,
                          size,
                          "assets/images/events/clock.png",
                          "Booking History",
                        ),
                        _buildRow(
                          context,
                          size,
                          "assets/images/events/circle.png",
                          "My points",
                        ),
                        _buildRow(
                          context,
                          size,
                          "assets/images/events/circle.png",
                          "My communities",
                        ),
                        _buildRow(
                          context,
                          size,
                          "assets/images/events/start.png",
                          "My Reviews",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRow(
      BuildContext context, Size size, String imagePath, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 16,
                height: 16,
              ),
              const SizedBox(width: 8),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                  color: CustomColors.neutral,
                ),
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
            color: CustomColors.neutral,
          ),
        ],
      ),
    );
  }

  Widget _menuBar(BuildContext context, Size size, bool isDark) {
    return Container(
      width: size.width * 0.9,
      height: size.height * 0.044,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildTab(context, size, "About", 0, isDark),
          const SizedBox(width: 10),
          _buildTab(context, size, "Events", 1, isDark),
          const SizedBox(width: 10),
          _buildTab(context, size, "Reviews", 2, isDark),
        ],
      ),
    );
  }

  Widget _buildTab(
      BuildContext context, Size size, String text, int index, bool isDark) {
    return Expanded(
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        onTap: () => _onTabButtonPress(index),
        child: Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          decoration: (selectedIndex == index)
              ? BoxDecoration(
                  color: CustomColors.primary[300]!,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                )
              : BoxDecoration(
                  border: Border.all(
                    color: CustomColors.primary[300]!,
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
          child: Text(
            text,
            style: (selectedIndex == index)
                ? TextStyle(
                    color: isDark ? Colors.black : Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  )
                : TextStyle(
                    color: CustomColors.primary[300],
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
          ),
        ),
      ),
    );
  }

  void _onTabButtonPress(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}
