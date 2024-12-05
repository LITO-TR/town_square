import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:town_square/config/constants/notifications_filter.dart';

import 'package:town_square/infrastructure/constants/data.dart';

import 'package:town_square/presentation/activities/providers/selection_provider.dart';
import 'package:town_square/presentation/notifications/widgets/notification_card_widget.dart';
import 'package:town_square/presentation/shared/widgets/custom_app_bar_widget.dart';

class NotificationsView extends ConsumerWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);

    final selectedNotificationsFilter =
        ref.watch(selectedNotificationsFilterProvider);
    return Scaffold(
        appBar: const CustomAppBarWidget(
          title: 'Notifications',
        ),
        body: SizedBox(
          width: size.width * 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.025),
                Row(
                  children: notificationsFilers.map((item) {
                    final isSelected = selectedNotificationsFilter == item;

                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          ref
                              .read(
                                  selectedNotificationsFilterProvider.notifier)
                              .state = item;
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.black : Colors.white,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            item,
                            style: TextStyle(
                                color:
                                    isSelected ? Colors.white : Colors.black),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: size.height * 0.025),
                Expanded(
                  child: ListView.builder(
                    itemCount: notifications.length,
                    itemBuilder: (context, index) {
                      final notification = notifications[index];
                      return NotificationCardWidget(
                        notification: notification,
                        textTheme: textTheme,
                        size: size,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
