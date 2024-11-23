import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:town_square/domain/activity_entity.dart';
import 'package:town_square/infrastructure/constants/data.dart';

final activitiesProvider =
    StateNotifierProvider<ActivitiesNotifier, ActivitiesState>((ref) {
  return ActivitiesNotifier();
});

class ActivitiesNotifier extends StateNotifier<ActivitiesState> {
  ActivitiesNotifier() : super(ActivitiesState());

  Future<void> getActivities() async {
    try {
      state = state.copyWith(isLoading: true);
      await Future.delayed(const Duration(seconds: 2));
      final List<ActivityEntity> activitiesList = activities;
      state = state.copyWith(
        allActivities: activitiesList,
        activities: activitiesList,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: "Error al cargar actividades",
      );
    }
  }

  void filterActivitiesByCategory(ActivityCategory category) {
    if (category == ActivityCategory.all) {
      state = state.copyWith(
        activities: state.allActivities,
        selectedCategory: category,
      );
    } else {
      final filteredActivities = state.allActivities
          .where((activity) => activity.category == category)
          .toList();
      state = state.copyWith(
        activities: filteredActivities,
        selectedCategory: category,
      );
    }
  }

  void resetFilter() {
    state = state.copyWith(
      activities: state.allActivities,
      selectedCategory: ActivityCategory.all,
    );
  }
}

class ActivitiesState {
  final List<ActivityEntity> activities;
  final List<ActivityEntity> allActivities;
  final bool isLoading;
  final String errorMessage;
  final ActivityCategory selectedCategory;

  ActivitiesState({
    this.activities = const [],
    this.allActivities = const [],
    this.isLoading = false,
    this.errorMessage = "",
    this.selectedCategory = ActivityCategory.all,
  });

  ActivitiesState copyWith({
    List<ActivityEntity>? activities,
    List<ActivityEntity>? allActivities,
    bool? isLoading,
    String? errorMessage,
    ActivityCategory? selectedCategory,
  }) {
    return ActivitiesState(
      activities: activities ?? this.activities,
      allActivities: allActivities ?? this.allActivities,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}
