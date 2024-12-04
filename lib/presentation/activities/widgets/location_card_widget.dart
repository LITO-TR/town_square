import 'package:flutter/material.dart';
import 'package:town_square/config/theme/custom_colors.dart';

class LocationCardWidget extends StatelessWidget {
  const LocationCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: size.width * 0.85,
      height: 51,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
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
