import 'package:town_square/domain/activity_entity.dart';

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
  ),
];
