import 'package:flutter/material.dart';
import 'package:town_square/config/theme/custom_colors.dart';

class EventDetailsWidget extends StatelessWidget {
  const EventDetailsWidget({super.key, required this.isDark});
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isDark ? CustomColors.neutral[900] : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1F000000),
            offset: Offset(3, 3),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/events/ticket.png',
                    width: 16,
                    height: 16,
                    color: isDark
                        ? CustomColors.neutral[500]
                        : CustomColors.neutral[600],
                  ),
                  Text('   Tickets',
                      style: textTheme.bodyLarge?.copyWith(
                        fontSize: 16,
                        color: isDark
                            ? CustomColors.neutral[500]
                            : CustomColors.neutral[600],
                      )),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Free  ',
                    style: textTheme.bodyMedium?.copyWith(
                      color: isDark
                          ? CustomColors.neutral[500]
                          : CustomColors.neutral[600],
                    ),
                  ),
                  Image.asset(
                    'assets/images/events/pencil.png',
                    color: isDark
                        ? CustomColors.neutral[500]
                        : CustomColors.neutral[600],
                    width: 14,
                    height: 14,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    width: 16,
                    height: 16,
                    'assets/images/events/circle.png',
                    color: isDark
                        ? CustomColors.neutral[500]
                        : CustomColors.neutral[600],
                  ),
                  Text('   Capacity',
                      style: textTheme.bodyLarge?.copyWith(
                        fontSize: 16,
                        color: isDark
                            ? CustomColors.neutral[500]
                            : CustomColors.neutral[600],
                      )),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Unlimited  ',
                    style: textTheme.bodyMedium?.copyWith(
                      color: isDark
                          ? CustomColors.neutral[500]
                          : CustomColors.neutral[600],
                    ),
                  ),
                  Image.asset(
                    'assets/images/events/pencil.png',
                    width: 14,
                    height: 14,
                    color: isDark
                        ? CustomColors.neutral[500]
                        : CustomColors.neutral[600],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    width: 16,
                    height: 16,
                    'assets/images/events/filters.png',
                    color: isDark
                        ? CustomColors.neutral[500]
                        : CustomColors.neutral[600],
                  ),
                  Text('   Category',
                      style: textTheme.bodyLarge?.copyWith(
                        fontSize: 16,
                        color: isDark
                            ? CustomColors.neutral[500]
                            : CustomColors.neutral[600],
                      )),
                ],
              ),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: isDark
                    ? CustomColors.neutral[500]
                    : CustomColors.neutral[600],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    width: 16,
                    height: 16,
                    'assets/images/events/tag.png',
                    color: isDark
                        ? CustomColors.neutral[500]
                        : CustomColors.neutral[600],
                  ),
                  Text('   Childcare',
                      style: textTheme.bodyLarge?.copyWith(
                        fontSize: 16,
                        color: isDark
                            ? CustomColors.neutral[500]
                            : CustomColors.neutral[600],
                      )),
                ],
              ),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: isDark
                    ? CustomColors.neutral[500]
                    : CustomColors.neutral[600],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    width: 16,
                    height: 16,
                    'assets/images/events/tag.png',
                    color: isDark
                        ? CustomColors.neutral[500]
                        : CustomColors.neutral[600],
                  ),
                  Text('   Itensy',
                      style: textTheme.bodyLarge?.copyWith(
                        fontSize: 16,
                        color: isDark
                            ? CustomColors.neutral[500]
                            : CustomColors.neutral[600],
                      )),
                ],
              ),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: isDark
                    ? CustomColors.neutral[500]
                    : CustomColors.neutral[600],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    width: 16,
                    height: 16,
                    'assets/images/events/users.png',
                    color: isDark
                        ? CustomColors.neutral[500]
                        : CustomColors.neutral[600],
                  ),
                  Text('   Add collaborator',
                      style: textTheme.bodyLarge?.copyWith(
                        fontSize: 16,
                        color: isDark
                            ? CustomColors.neutral[500]
                            : CustomColors.neutral[600],
                      )),
                ],
              ),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: isDark
                    ? CustomColors.neutral[500]
                    : CustomColors.neutral[600],
              )
            ],
          ),
        ],
      ),
    );
  }
}
