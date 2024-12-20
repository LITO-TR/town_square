import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:town_square/config/helper/show_modal_bottom_sheet_helper.dart';
import 'package:town_square/config/theme/custom_colors.dart';
import 'package:town_square/infrastructure/constants/data.dart';
import 'package:town_square/presentation/activities/providers/activities_provider.dart';
import 'package:town_square/presentation/activities/widgets/category_item_widget.dart';
import 'package:town_square/presentation/shared/providers/theme_provider.dart';

class CategoryListWidget extends ConsumerWidget {
  final bool hideFirstItem;

  const CategoryListWidget({super.key, required this.hideFirstItem});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activitiesState = ref.watch(activitiesProvider);
    final themePv = ref.watch(themeProvider);
    return SizedBox(
      height: 30,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: hideFirstItem
            ? ActivityCategory.values.length
            : 1 + ActivityCategory.values.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          if (!hideFirstItem && index == 0) {
            return GestureDetector(
              onTap: () {
                ShowModalBottomSheetHelper()
                    .showFiltersBottomSheet(context, themePv);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                decoration: BoxDecoration(
                  color: CustomColors.secondaryB[200],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Image.asset('assets/images/icons/sliders.png'),
              ),
            );
          } else {
            final category =
                ActivityCategory.values[hideFirstItem ? index : index - 1];
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
