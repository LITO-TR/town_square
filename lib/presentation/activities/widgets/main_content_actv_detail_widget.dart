import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:town_square/config/helper/get_service_widget.dart';
import 'package:town_square/domain/entities/activity_entity.dart';
import 'package:town_square/presentation/activities/widgets/activity_information_item_widget.dart';

import 'package:town_square/presentation/activities/widgets/organizer_activity_widget.dart';
import 'package:town_square/presentation/shared/providers/device_type_provider.dart';

class MainContentActvDetailWidget extends ConsumerWidget {
  const MainContentActvDetailWidget(
      {super.key,
      required this.size,
      required this.activity,
      required this.isDark});

  final Size size;
  final ActivityEntity activity;
  final bool isDark;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final deviceType = ref.watch(deviceTypeProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 16),
      decoration: BoxDecoration(
        color: isDark ? Colors.black : Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(activity.title,
                style: textTheme.displayLarge
                    ?.copyWith(fontSize: 34, fontWeight: FontWeight.w700)),
            SizedBox(
              height: size.height * 0.025,
            ),
            ActivityInformationItemWidget(
              icon: Icons.calendar_today_outlined,
              title: activity.date,
              subtitle: '${activity.time} (Drop in)',
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            ActivityInformationItemWidget(
              icon: Icons.location_on_outlined,
              title: activity.location,
              subtitle: activity.estado,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              children: [
                Image.asset(
                  width: deviceType == DeviceType.desktop
                      ? size.width * 0.41
                      : size.width * 0.86,
                  height: 98,
                  'assets/images/map.png',
                  fit: BoxFit.fill,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const OrganizerActivityWidget(),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              'About Event',
              style: textTheme.titleMedium,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              children: [
                ...activity.services.map((service) => Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: getServiceWidget(service, textTheme),
                    )),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const Text(
                'Join us for a rejuvenating yoga session on the beach! Breathe in the fresh ocean air, feel the sand between your toes, and let the sound of the waves soothe your mind. This class is suitable for all levels, from beginners to experienced yogis.\nWhat to bring:\n- Yoga mat (or a beach towel)\n-Water bottle'),
            SizedBox(
              height: size.height * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}
