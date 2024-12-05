import 'package:town_square/domain/entities/activity_entity.dart';
import 'package:town_square/domain/entities/notification_entity.dart';

enum ActivityCategory {
  all("All"),
  sports("Sports"),
  food("Food"),
  kids("Kids"),
  creative("Creative"),
  popular("Popular"),
  calm("Calm");

  final String displayName;

  const ActivityCategory(this.displayName);
}

List<ActivityEntity> activities = [
  ActivityEntity(
    time: "08:00",
    duration: "60 min",
    title: "Beach Yoga",
    location: "La Playa de la Rada",
    availableSpots: 8,
    price: 9,
    isHourly: false,
    category: ActivityCategory.calm,
    services: ['light', 'workspace'],
    organizerName: "Ashfak Sayem",
    estado: "Estepona, Malaga",
    date: "Friday, November 29",
  ),
  ActivityEntity(
    time: "09:00",
    duration: "60 min",
    title: "Reformer Pilates",
    location: "Sala de Arte",
    availableSpots: 3,
    price: 12,
    isHourly: false,
    category: ActivityCategory.creative,
    services: ['medium', 'childcare'],
    organizerName: "Maria Lopez",
    estado: "Madrid, Spain",
    date: "Saturday, December 1",
  ),
  ActivityEntity(
    time: "12:30",
    duration: "45 min",
    title: "5-a-side Football",
    location: "Municipal Sports Center",
    availableSpots: 0,
    price: 19,
    isHourly: false,
    category: ActivityCategory.sports,
    services: ['high', 'workspace'],
    organizerName: "John Doe",
    estado: "Barcelona, Spain",
    date: "Sunday, December 2",
  ),
  ActivityEntity(
    time: "13:15",
    duration: "60 min",
    title: "Standing Tapas Lunch",
    location: "Casa Marina",
    availableSpots: 9,
    price: 0,
    isHourly: false,
    category: ActivityCategory.food,
    services: ['workspace', 'childcare'],
    organizerName: "Laura Martinez",
    estado: "Seville, Spain",
    date: "Monday, December 3",
  ),
  ActivityEntity(
    time: "15:00",
    duration: "Drop-in until 20:00",
    title: "Kids LEGO Club",
    location: "La Bloqueria",
    availableSpots: 5,
    price: 10,
    isHourly: true,
    category: ActivityCategory.kids,
    services: ['childcare', 'workspace'],
    organizerName: "Carlos Sanchez",
    estado: "Valencia, Spain",
    date: "Tuesday, December 4",
  ),
  ActivityEntity(
    time: "15:00",
    duration: "60 min",
    title: "5-a-side Football",
    location: "Municipal Sports Center",
    availableSpots: 4,
    price: 19,
    isHourly: false,
    category: ActivityCategory.sports,
    services: ['high', 'workspace'],
    organizerName: "Ana Garcia",
    estado: "Bilbao, Spain",
    date: "Wednesday, December 5",
  ),
];

List<NotificationEntity> notifications = [
  NotificationEntity(
    nameUser: "German Jose",
    nameActivity: "5-a-side Football",
    time: "Just now",
    avatarImage: "assets/images/notifications/not_profile1.png",
    typeNotification: NotificationType.invitation,
  ),
  NotificationEntity(
    nameUser: "Emily Smith",
    nameActivity: "Beach Yoga",
    time: "10 min ago",
    avatarImage: "assets/images/notifications/not_profile2.png",
    typeNotification: NotificationType.join,
  ),
  NotificationEntity(
    nameUser: "Amelia White",
    nameActivity: "Kids Finger Painting Session",
    time: "1h ago",
    avatarImage: "assets/images/notifications/not_profile3.png",
    typeNotification: NotificationType.invitation,
  ),
  NotificationEntity(
    nameUser: "Clara Baker",
    nameActivity: "",
    time: "yesterday",
    avatarImage: "assets/images/notifications/not_profile4.png",
    typeNotification: NotificationType.friendRequest,
  ),
];
