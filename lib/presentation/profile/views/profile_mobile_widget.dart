import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:town_square/config/theme/custom_colors.dart';
import 'package:town_square/presentation/profile/widgets/about_widget.dart';
import 'package:town_square/presentation/profile/widgets/info_profile_widget.dart';
import 'package:town_square/presentation/profile/widgets/my_events_widgets.dart';
import 'package:town_square/presentation/profile/widgets/organized_assisted_widget.dart';
import 'package:town_square/presentation/profile/widgets/reviews_widget.dart';
import 'package:town_square/presentation/shared/providers/theme_provider.dart';

class ProfileMobileView extends ConsumerStatefulWidget {
  const ProfileMobileView({super.key});

  @override
  _ProfileMobileViewState createState() => _ProfileMobileViewState();
}

class _ProfileMobileViewState extends ConsumerState<ProfileMobileView>
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

    return SizedBox(
      width: size.width,
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
                      ?.copyWith(color: isDark ? Colors.black : Colors.white),
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
