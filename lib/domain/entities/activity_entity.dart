import 'package:town_square/infrastructure/constants/data.dart';

class ActivityEntity {
  final String time;
  final String duration;
  final String title;
  final String location;
  final int availableSpots;
  final double price;
  final bool isHourly;
  final ActivityCategory category;
  final List<String> services;
  final String organizerName;
  final String estado;
  final String date;
  ActivityEntity({
    required this.time,
    required this.duration,
    required this.title,
    required this.location,
    required this.availableSpots,
    required this.price,
    required this.isHourly,
    required this.category,
    required this.services,
    required this.organizerName,
    required this.estado,
    required this.date,
  });
}
