import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:town_square/config/theme/custom_colors.dart';

import 'package:town_square/presentation/activities/widgets/cetegory_list_widget.dart';
import 'package:town_square/presentation/activities/widgets/custom_buttons_show_modal_widget.dart';
import 'package:town_square/presentation/activities/widgets/custom_text_form_field_filters_widget.dart';
import 'package:town_square/presentation/activities/widgets/location_card_widget.dart';
import 'package:town_square/presentation/activities/widgets/price_range_widget.dart';
import 'package:town_square/presentation/activities/widgets/time_date_list_widget.dart';

class ShowModalBottomSheetHelper {
  void showFiltersBottomSheet(
    BuildContext context,
    bool isDark,
  ) {
    final ValueNotifier<bool> isExpanded = ValueNotifier(false);

    showModalBottomSheet(
      useRootNavigator: true,
      isScrollControlled: true,
      context: context,
      backgroundColor: isDark ? Colors.black : CustomColors.neutral[100],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(36)),
      ),
      builder: (context) {
        final size = MediaQuery.sizeOf(context);
        final textTheme = Theme.of(context).textTheme;
        return DraggableScrollableSheet(
          snap: true,
          initialChildSize: 0.9,
          minChildSize: 0.5,
          maxChildSize: 1.0,
          expand: false,
          builder: (context, scrollController) {
            return NotificationListener<DraggableScrollableNotification>(
              onNotification: (notification) {
                if (isExpanded.value = notification.extent == 1.0) {
                  return true;
                } else {
                  return false;
                }
              },
              child: SingleChildScrollView(
                controller: scrollController,
                child: ValueListenableBuilder<bool>(
                  valueListenable: isExpanded,
                  builder: (context, expanded, child) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * 0.015),
                        Center(
                          child: Container(
                            margin: const EdgeInsets.only(top: 8.0),
                            width: 26,
                            height: 4,
                            decoration: BoxDecoration(
                              color: CustomColors.neutral[300],
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.045),
                        if (!expanded)
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child:
                                Text('Filters', style: textTheme.displaySmall),
                          )
                        else
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                    onTap: () {
                                      context.pop();
                                    },
                                    child: const Icon(
                                        Icons.arrow_back_ios_rounded)),
                                const SizedBox(height: 20),
                                SizedBox(
                                  width: size.width * 0.85,
                                  child: const CustomTextFormFieldFiltersWidget(
                                    hint: 'What do you feel like doing?',
                                    suffixIcon: Icon(
                                      size: 24,
                                      Icons.search_outlined,
                                      color: CustomColors.neutral,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        SizedBox(height: size.height * 0.03),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text(
                            'Category',
                            style: textTheme.bodyLarge?.copyWith(fontSize: 16),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        const Padding(
                          padding: EdgeInsets.only(left: 30.0),
                          child: CategoryListWidget(
                            hideFirstItem: true,
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text(
                            'Time & Date',
                            style: textTheme.bodyLarge?.copyWith(fontSize: 16),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        const Padding(
                          padding: EdgeInsets.only(left: 30.0),
                          child: TimeDateListWidget(),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text(
                            'Location',
                            style: textTheme.bodyLarge?.copyWith(fontSize: 16),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        const Padding(
                          padding: EdgeInsets.only(left: 30.0),
                          child: LocationCardWidget(),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text(
                            'Price range',
                            style: textTheme.bodyLarge?.copyWith(fontSize: 16),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        const Padding(
                          padding: EdgeInsets.only(left: 0.0),
                          child: PriceRangeWidget(),
                        ),
                        SizedBox(height: size.height * 0.03),
                        const Padding(
                          padding: EdgeInsets.only(left: 30.0),
                          child: CustomButtonsShowModalWidget(),
                        ),
                        SizedBox(height: size.height * 0.03),
                      ],
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
