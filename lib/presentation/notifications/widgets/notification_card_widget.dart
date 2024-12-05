import 'package:flutter/material.dart';
import 'package:town_square/config/theme/custom_colors.dart';
import 'package:town_square/domain/entities/notification_entity.dart';

class NotificationCardWidget extends StatelessWidget {
  final NotificationEntity notification;
  final TextTheme textTheme;
  final Size size;
  const NotificationCardWidget({
    super.key,
    required this.notification,
    required this.textTheme,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    String additionalText;
    switch (notification.typeNotification) {
      case NotificationType.invitation:
        additionalText = " sent you an invitation";
        break;
      case NotificationType.join:
        additionalText = " joined your event";
        break;
      case NotificationType.friendRequest:
        additionalText = " sent you a friend request";
        break;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color(0x1F000000),
              offset: Offset(3, 3),
              blurRadius: 8,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(notification.avatarImage),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: notification.nameUser,
                        style: textTheme.bodyLarge?.copyWith(fontSize: 16),
                      ),
                      TextSpan(
                        text: additionalText,
                        style: textTheme.bodyLarge?.copyWith(
                          fontSize: 16,
                          color: CustomColors.neutral[600],
                        ),
                      ),
                    ],
                  ),
                ),
                if (notification.typeNotification ==
                        NotificationType.invitation ||
                    notification.typeNotification == NotificationType.join)
                  const SizedBox(
                    height: 6,
                  ),
                if (notification.typeNotification ==
                        NotificationType.invitation ||
                    notification.typeNotification == NotificationType.join)
                  Text(notification.nameActivity,
                      style: textTheme.bodyLarge?.copyWith(fontSize: 16)),
                const SizedBox(
                  height: 8,
                ),
                if (notification.typeNotification ==
                        NotificationType.invitation ||
                    notification.typeNotification ==
                        NotificationType.friendRequest)
                  SizedBox(
                    width: size.width * 0.67,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: size.width * 0.3,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: CustomColors.neutral),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Center(
                            child: Text(
                              "Reset",
                              style: TextStyle(color: Color(0xFF6C757D)),
                            ),
                          ),
                        ),
                        Container(
                          width: size.width * 0.3,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: CustomColors.primary[300]!,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Center(
                            child: Text(
                              'Apply',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(
                  height: 4,
                ),
                Text(notification.time.toString(),
                    style: textTheme.bodySmall
                        ?.copyWith(color: CustomColors.neutral[600])),
              ],
            )
          ],
        ),
      ),
    );
  }
}