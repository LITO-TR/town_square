import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:town_square/domain/entities/activity_entity.dart';

import 'package:town_square/presentation/activities/views/activity_detail_view.dart';

class CustomEndDrawerWidget extends ConsumerWidget {
  const CustomEndDrawerWidget({
    super.key,
    required this.activity,
  });
  final ActivityEntity activity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ActivityDetailView(
              activity: activity,
            )
          ],
        ),
      ),
    );
  }
}
