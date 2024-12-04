import 'package:flutter/material.dart';
import 'package:town_square/config/theme/custom_colors.dart';

class PriceRangeWidget extends StatefulWidget {
  const PriceRangeWidget({super.key});

  @override
  PriceRangeWidgetState createState() => PriceRangeWidgetState();
}

class PriceRangeWidgetState extends State<PriceRangeWidget> {
  RangeValues _currentRangeValues = const RangeValues(0, 20);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: SizedBox(
            width: size.width * 0.85,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('0€',
                    style: textTheme.bodyLarge?.copyWith(
                        color: CustomColors.neutral[600],
                        fontWeight: FontWeight.w700)),
                Text('20€',
                    style: textTheme.bodyLarge?.copyWith(
                        color: CustomColors.neutral[600],
                        fontWeight: FontWeight.w700)),
              ],
            ),
          ),
        ),
        SizedBox(
          width: size.width * 0.99,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: RangeSlider(
              activeColor: Colors.black,
              inactiveColor: CustomColors.neutral[400],
              values: _currentRangeValues,
              min: 0,
              max: 20,
              labels: RangeLabels(
                _currentRangeValues.start.toStringAsFixed(0),
                _currentRangeValues.end.toStringAsFixed(0),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _currentRangeValues = values;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
