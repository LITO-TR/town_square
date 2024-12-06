import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:town_square/config/theme/custom_colors.dart';
import 'package:town_square/presentation/activities/widgets/custom_card_goal_desktop_widget.dart';
import 'package:town_square/presentation/profile/widgets/about_widget.dart';
import 'package:town_square/presentation/profile/widgets/info_profile_widget.dart';
import 'package:town_square/presentation/profile/widgets/my_events_widgets.dart';
import 'package:town_square/presentation/profile/widgets/organized_assisted_widget.dart';
import 'package:town_square/presentation/profile/widgets/reviews_widget.dart';
import 'package:town_square/presentation/shared/providers/device_type_provider.dart';
import 'package:town_square/presentation/shared/providers/theme_provider.dart';
import 'package:town_square/presentation/shared/widgets/custom_app_bar_widget.dart';
import 'package:intl/intl.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ProfileViewState createState() => ProfileViewState();
}

class ProfileViewState extends ConsumerState<ProfileView>
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
    final deviceType = ref.watch(deviceTypeProvider);
    final themePv = ref.watch(themeProvider);
    return Scaffold(
      appBar: deviceType == DeviceType.mobile
          ? const CustomAppBarWidget(title: 'Profile')
          : null,
      body: deviceType == DeviceType.mobile
          ? _buildMobileLayout(size, themePv)
          : _buildDesktopLayout(size, themePv),
    );
  }

  Widget _buildMobileLayout(Size size, bool isDark) {
    return SizedBox(
      width: size.width * 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.015),
            const InfoProfileWidget(),
            SizedBox(height: size.height * 0.02),
            const OrganizedAssistedWidget(),
            SizedBox(height: size.height * 0.02),
            Container(
              width: size.width * 0.9,
              height: 1,
              color: const Color(0xFFEBEEF2),
            ),
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
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: isDark ? Colors.white : Colors.black),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Container(
              width: size.width * 0.9,
              height: 1,
              color: const Color(0xFFEBEEF2),
            ),
            SizedBox(height: size.height * 0.02),
            _menuBar(context, size, isDark),
            SizedBox(height: size.height * 0.02),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const ClampingScrollPhysics(),
                onPageChanged: (int i) {
                  FocusScope.of(context).requestFocus(FocusNode());
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
            SizedBox(height: size.height * 0.02),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(Size size, bool isDark) {
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
                          color: isDark ? Colors.black : Colors.black,
                          fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                SizedBox(height: size.height * 0.02),
                _menuBar(context, size, isDark),
                SizedBox(height: size.height * 0.02),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    physics: const ClampingScrollPhysics(),
                    onPageChanged: (int i) {
                      FocusScope.of(context).requestFocus(FocusNode());
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
                SizedBox(height: size.height * 0.02),
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        //ref.read(themeProvider.notifier).toggleTheme();
                        context.push('/activities/notifications');
                      },
                      child: Image.asset(
                        color: isDark ? Colors.white : Colors.black,
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
                        backgroundImage:
                            AssetImage('assets/images/profile.png'),
                        radius: 15,
                        backgroundColor: Colors.yellow,
                      ),
                    ),
                  ],
                ),
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
                  child: TableCalendar(
                    rowHeight: 33,
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle:
                          const TextStyle(color: Colors.white, fontSize: 10),
                      weekendStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      dowTextFormatter: (date, locale) =>
                          DateFormat.E(locale).format(date).substring(0, 1),
                    ),
                    calendarStyle: CalendarStyle(
                      outsideTextStyle: TextStyle(
                          color: CustomColors.neutral[600], fontSize: 12),
                      defaultTextStyle:
                          const TextStyle(color: Colors.white, fontSize: 12),
                      weekendTextStyle:
                          const TextStyle(color: Colors.white, fontSize: 12),
                      todayTextStyle: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      todayDecoration: BoxDecoration(
                        color: CustomColors.primary[300],
                        shape: BoxShape.circle,
                      ),
                      selectedTextStyle: const TextStyle(color: Colors.white),
                      selectedDecoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                    focusedDay: DateTime.now(),
                    firstDay: DateTime(2010, 10, 16),
                    lastDay: DateTime(2030, 10, 16),
                    headerStyle: HeaderStyle(
                      formatButtonTextStyle: TextStyle(color: Colors.yellow),
                      titleTextStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: CustomColors.neutral),
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextFormatter: (date, locale) =>
                          DateFormat.MMMM(locale).format(date),
                    ),
                    calendarBuilders: CalendarBuilders(
                      todayBuilder: (context, date, _) {
                        return Center(
                          child: Container(
                            decoration: BoxDecoration(
                                color: CustomColors.primary[400],
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(67)),
                            width: 35,
                            height: 35,
                            child: Center(
                              child: Text(
                                '${date.day}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
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
