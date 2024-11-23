import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:town_square/config/theme/custom_colors.dart';
import 'package:town_square/infrastructure/constants/data.dart';
import 'package:town_square/presentation/activities/providers/activities_provider.dart';
import 'package:town_square/presentation/activities/widgets/category_item_widget.dart';

class CategoryListWidget extends ConsumerWidget {
  const CategoryListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activitiesState = ref.watch(activitiesProvider);

    return SizedBox(
      height: 30,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 1 + ActivityCategory.values.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                decoration: BoxDecoration(
                  color: CustomColors.secondaryB[200],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(
                  Icons.settings,
                  color: Colors.black,
                ));
          } else {
            final category = ActivityCategory.values[index - 1];
            return CategoryItemWidget(
              category: category,
              isSelected: activitiesState.selectedCategory == category,
              onPressed: () {
                ref
                    .read(activitiesProvider.notifier)
                    .filterActivitiesByCategory(category);
              },
            );
          }
        },
      ),
    );
  }
}
