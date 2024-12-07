import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:town_square/presentation/activities/providers/activities_provider.dart';
import 'package:town_square/presentation/activities/widgets/activity_card_widget.dart';
import 'package:town_square/presentation/activities/widgets/dashed_line_with_titles_widget.dart';
import 'package:town_square/presentation/shared/providers/theme_provider.dart';

class ActivitiesListWidget extends ConsumerStatefulWidget {
  const ActivitiesListWidget({super.key});

  @override
  ActivitiesListWidgetState createState() => ActivitiesListWidgetState();
}

class ActivitiesListWidgetState extends ConsumerState<ActivitiesListWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    Future.microtask(() {
      ref.read(activitiesProvider.notifier).getActivities();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themePv = ref.watch(themeProvider);

    return Consumer(
      builder: (context, ref, child) {
        final activities = ref.watch(activitiesProvider);

        _controller.reset();
        _controller.forward();

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DashedLineWithTitlesWidget(
              isDark: themePv,
              activitiesCount: activities.activities.length,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  if (activities.isLoading)
                    const Center(
                      child: CircularProgressIndicator(),
                    )
                  else
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: activities.activities.isEmpty
                          ? const Center(
                              child: Text(
                                'There are no activities.',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            )
                          : Column(
                              key: ValueKey(activities.activities.length),
                              children: activities.activities.map((activity) {
                                return FadeTransition(
                                  opacity: _controller,
                                  child: ActivityCardWidget(activity: activity),
                                );
                              }).toList(),
                            ),
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
