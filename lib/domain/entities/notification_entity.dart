enum NotificationType {
  invitation,
  join,
  friendRequest,
}

class NotificationEntity {
  final String nameUser;
  final String nameActivity;
  final String time;
  final String avatarImage;
  final NotificationType typeNotification;

  NotificationEntity({
    required this.nameUser,
    required this.nameActivity,
    required this.time,
    required this.avatarImage,
    required this.typeNotification,
  });
}
