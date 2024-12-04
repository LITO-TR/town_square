import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:town_square/config/constants/time_date.dart';
import 'package:town_square/config/theme/custom_colors.dart';
import 'package:town_square/presentation/activities/providers/selection_provider.dart';

class TimeDateListWidget extends ConsumerWidget {
  const TimeDateListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTimeDate = ref.watch(selectedTimeDateProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: timeDate.map((item) {
            final isSelected = selectedTimeDate == item;

            return Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: () {
                  ref.read(selectedTimeDateProvider.notifier).state = item;
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? CustomColors.secondaryB[300]!
                        : Colors.white,
                    border: Border.all(
                        color: isSelected
                            ? CustomColors.secondaryB[300]!
                            : const Color(0xFF6C757D)),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    item,
                    style: TextStyle(
                        color: isSelected
                            ? Colors.black
                            : const Color(0xFF6C757D)),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFF6C757D)),
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.calendar_today_outlined,
                color: Color(0xFF6C757D),
              ),
              Text(
                '    Choose from calendar',
                style: TextStyle(color: Color(0xFF6C757D)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
