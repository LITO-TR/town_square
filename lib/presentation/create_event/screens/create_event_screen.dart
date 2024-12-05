import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:town_square/config/theme/custom_colors.dart';
import 'package:town_square/presentation/create_event/widgets/event_details_widget.dart';
import 'package:town_square/presentation/create_event/widgets/info_card_widget.dart';
import 'package:town_square/presentation/create_event/widgets/personal_calendar_widget.dart';
import 'package:town_square/presentation/create_event/widgets/upload_image_widget.dart';
import 'package:town_square/presentation/shared/providers/device_type_provider.dart';
import 'package:town_square/presentation/shared/providers/theme_provider.dart';

class CreateEventScreen extends ConsumerWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);
    final deviceType = ref.watch(deviceTypeProvider);
    final themePv = ref.watch(themeProvider);
    return Scaffold(
      appBar:
          (deviceType == DeviceType.mobile) ? _buildAppBar(textTheme) : null,
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width * 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: (deviceType == DeviceType.desktop)
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            SizedBox(height: size.height * 0.08),
                            const UploadImageWidget(),
                            SizedBox(height: size.height * 0.02),
                            InfoCardWidget(
                              icon: Icons.location_on_outlined,
                              title: 'Add Collaborator',
                              textTheme: textTheme,
                              iconEnd: Icons.add,
                              isDark: themePv,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 40),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: size.height * 0.05,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    //ref.read(themeProvider.notifier).toggleTheme();
                                    context
                                        .push('/home/activities/notifications');
                                  },
                                  child: Image.asset(
                                    color:
                                        themePv ? Colors.white : Colors.black,
                                    'assets/images/icons/bell.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/profile.png'),
                                  radius: 14,
                                  backgroundColor: Colors.yellow,
                                ),
                              ],
                            ),
                            PersonalCalendarWidget(
                              isDark: themePv,
                            ),
                            SizedBox(height: size.height * 0.03),
                            _buildTitle('Event Name', textTheme, fontSize: 40),
                            SizedBox(height: size.height * 0.03),
                            InfoCardWidget(
                              icon: Icons.watch_later_outlined,
                              title: 'Friday, November 29',
                              subtitle: '11:00 - 12:00 GMT',
                              textTheme: textTheme,
                              isDark: themePv,
                            ),
                            SizedBox(height: size.height * 0.02),
                            InfoCardWidget(
                              icon: Icons.location_on_outlined,
                              title: 'Add Event Location',
                              textTheme: textTheme,
                              isDark: themePv,
                            ),
                            SizedBox(height: size.height * 0.02),
                            InfoCardWidget(
                              imagePath: 'assets/images/clipboard.png',
                              title: 'Add Description',
                              textTheme: textTheme,
                              isDark: themePv,
                            ),
                            SizedBox(height: size.height * 0.025),
                            _buildSectionTitle('Event Details', textTheme),
                            SizedBox(height: size.height * 0.025),
                            EventDetailsWidget(
                              isDark: themePv,
                            ),
                            SizedBox(height: size.height * 0.025),
                            _buildCreateEventButton(context),
                            SizedBox(height: size.height * 0.025),
                          ],
                        ),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const UploadImageWidget(),
                      SizedBox(height: size.height * 0.028),
                      _buildTitle('Event Name', textTheme, fontSize: 32),
                      SizedBox(height: size.height * 0.02),
                      PersonalCalendarWidget(
                        isDark: themePv,
                      ),
                      SizedBox(height: size.height * 0.02),
                      InfoCardWidget(
                        icon: Icons.watch_later_outlined,
                        title: 'Friday, November 29',
                        subtitle: '11:00 - 12:00 GMT',
                        textTheme: textTheme,
                        isDark: themePv,
                      ),
                      SizedBox(height: size.height * 0.02),
                      InfoCardWidget(
                        icon: Icons.location_on_outlined,
                        title: 'Add Event Location',
                        textTheme: textTheme,
                        isDark: themePv,
                      ),
                      SizedBox(height: size.height * 0.02),
                      InfoCardWidget(
                        imagePath: 'assets/images/clipboard.png',
                        title: 'Add Description',
                        textTheme: textTheme,
                        isDark: themePv,
                      ),
                      SizedBox(height: size.height * 0.025),
                      _buildSectionTitle('Event Details', textTheme),
                      SizedBox(height: size.height * 0.025),
                      EventDetailsWidget(
                        isDark: themePv,
                      ),
                      SizedBox(height: size.height * 0.025),
                      _buildCreateEventButton(context),
                      SizedBox(height: size.height * 0.025),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(TextTheme textTheme) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text('Create Event', style: textTheme.displaySmall),
      centerTitle: false,
    );
  }

  Widget _buildTitle(String text, TextTheme textTheme, {double fontSize = 16}) {
    return Text(
      text,
      style: textTheme.displayMedium?.copyWith(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildSectionTitle(String text, TextTheme textTheme) {
    return Text(
      text,
      style: textTheme.bodyLarge?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildCreateEventButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: CustomColors.primary[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'Create Event',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
