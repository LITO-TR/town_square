import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:town_square/config/theme/custom_colors.dart';
import 'package:town_square/presentation/shared/providers/theme_provider.dart';

class LocationCardWidget extends ConsumerWidget {
  const LocationCardWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;
    final themePv = ref.watch(themeProvider);
    return Container(
      width: size.width * 0.85,
      height: 51,
      decoration: BoxDecoration(
          color: themePv ? CustomColors.neutral[900] : Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: CustomColors.secondaryB[200]!,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text('Estepona, Malaga', style: textTheme.bodyLarge)
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: CustomColors.neutral,
                size: 18,
              )
            ]),
      ),
    );
  }
}
