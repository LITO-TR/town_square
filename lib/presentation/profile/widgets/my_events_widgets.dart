import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:town_square/presentation/activities/providers/activities_provider.dart';

import 'package:town_square/presentation/profile/widgets/my_event_item.dart';

class MyEventsWidgets extends ConsumerWidget {
  const MyEventsWidgets({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activities = ref.watch(activitiesProvider);

    return SingleChildScrollView(
      child: Column(
        key: ValueKey(activities.activities.length),
        children: activities.activities.map((activity) {
          return MyEventItem(activity: activity);
        }).toList(),
      ),
    );
  }
}
