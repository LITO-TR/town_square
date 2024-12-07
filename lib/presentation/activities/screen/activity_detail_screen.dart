import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:town_square/domain/entities/activity_entity.dart';
import 'package:town_square/presentation/activities/views/activity_detail_view.dart';

class ActivityDetailScreen extends ConsumerWidget {
  const ActivityDetailScreen({super.key, required this.activity});

  final ActivityEntity activity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ActivityDetailView(activity: activity),
    );
  }
}
