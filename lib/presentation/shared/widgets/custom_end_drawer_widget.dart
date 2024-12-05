import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:town_square/domain/entities/activity_entity.dart';
import 'package:town_square/presentation/activities/screen/activity_detail_screen.dart';

class CustomEndDrawerWidget extends ConsumerWidget {
  const CustomEndDrawerWidget({
    super.key,
    required this.activity,
  });
  final ActivityEntity activity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ActivityDetailScreen(
              activity: activity,
            )
          ],
        ),
      ),
    );
  }
}
