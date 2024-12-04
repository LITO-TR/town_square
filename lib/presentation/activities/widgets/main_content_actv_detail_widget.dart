import 'package:flutter/material.dart';
import 'package:town_square/config/helper/get_service_widget.dart';
import 'package:town_square/domain/activity_entity.dart';
import 'package:town_square/presentation/activities/widgets/activity_information_item_widget.dart';

import 'package:town_square/presentation/activities/widgets/organizer_activity_widget.dart';

class MainContentActvDetailWidget extends StatelessWidget {
  const MainContentActvDetailWidget(
      {super.key, required this.size, required this.activity});

  final Size size;
  final ActivityEntity activity;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
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
            Image.asset(height: 98, 'assets/images/map.png'),
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
