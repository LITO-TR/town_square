import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:town_square/domain/entities/activity_entity.dart';

final selectedTimeDateProvider =
    StateProvider.autoDispose<String?>((ref) => null);

final selectedNotificationsFilterProvider =
    StateProvider.autoDispose<String>((ref) => 'All');

final selectedActivityProvider = StateProvider<ActivityEntity?>((ref) => null);
