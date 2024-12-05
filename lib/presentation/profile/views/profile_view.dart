import 'package:flutter/material.dart';
import 'package:town_square/config/theme/custom_colors.dart';
import 'package:town_square/presentation/profile/widgets/about_widget.dart';
import 'package:town_square/presentation/profile/widgets/info_profile_widget.dart';
import 'package:town_square/presentation/profile/widgets/my_events_widgets.dart';
import 'package:town_square/presentation/profile/widgets/organized_assisted_widget.dart';
import 'package:town_square/presentation/profile/widgets/reviews_widget.dart';
import 'package:town_square/presentation/shared/widgets/custom_app_bar_widget.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  ProfileViewState createState() => ProfileViewState();
}

class ProfileViewState extends State<ProfileView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Inicializar el TabController
    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      setState(() {
        selectedIndex = _tabController.index;
      });
    });
  }

  Widget customTab(String text, Color borderColor, bool isSelected) {
    return Container(
      width: 210,
      height: 53,
      decoration: BoxDecoration(
        color: isSelected ? CustomColors.primary[300] : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor, width: 2),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : borderColor,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: const CustomAppBarWidget(title: 'Profile'),
      body: SizedBox(
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
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
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
                        ?.copyWith(color: Colors.white),
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

              // Tab controller
              DefaultTabController(
                length: 3, // Tres tabs
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tabs
                    TabBar(
                      controller: _tabController,
                      splashFactory: NoSplash.splashFactory,
                      enableFeedback: false,
                      indicatorColor: Colors.transparent,
                      dividerColor: Colors.transparent,
                      tabs: [
                        Tab(
                          child: customTab(
                            'About',
                            CustomColors.primary[300]!,
                            _tabController.index == 0,
                          ),
                        ),
                        Tab(
                          child: customTab(
                            'Events',
                            CustomColors.primary[300]!,
                            _tabController.index == 1,
                          ),
                        ),
                        Tab(
                          child: customTab(
                            'Reviews',
                            CustomColors.primary[300]!,
                            _tabController.index == 2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.02),

                    SizedBox(
                      height: size.height * 0.3,
                      child: TabBarView(
                        controller:
                            _tabController, // Asociamos el controlador aquí también
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
              SizedBox(height: size.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
