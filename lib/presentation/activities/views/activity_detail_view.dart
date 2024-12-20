import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:town_square/domain/entities/activity_entity.dart';
import 'package:town_square/presentation/activities/widgets/background_image_actv_detail_widget.dart';
import 'package:town_square/presentation/activities/widgets/friends_content_actv_detail_widget.dart';
import 'package:town_square/presentation/activities/widgets/main_content_actv_detail_widget.dart';
import 'package:town_square/presentation/shared/providers/theme_provider.dart';

class ActivityDetailView extends ConsumerWidget {
  const ActivityDetailView({super.key, required this.activity});

  final ActivityEntity activity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final themePv = ref.watch(themeProvider);

    return SizedBox(
      height: size.height * 1,
      child: Stack(
        children: [
          BackgroundImageActvDetailWidget(size: size),
          Positioned(
            top: size.height * 0.3,
            left: 0,
            right: 0,
            bottom: 0,
            child: MainContentActvDetailWidget(
              size: size,
              activity: activity,
              isDark: themePv,
            ),
          ),
          FriendsContentActvDetailWidget(
            size: size,
            activity: activity,
            isDark: themePv,
          ),
          Positioned(
            top: size.height * 0.9,
            left: 0,
            right: 0,
            bottom: 10,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themePv ? Colors.white : Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Book for ${activity.price}€',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: themePv ? Colors.black : Colors.white,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
