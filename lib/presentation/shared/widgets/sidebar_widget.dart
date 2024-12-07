import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:town_square/config/theme/custom_colors.dart';
import 'package:town_square/presentation/shared/screens/home_screen.dart';

class SidebarWidget extends ConsumerWidget {
  final List<HomeItem> items;
  final int currentIndex;
  final Function(WidgetRef, int) onDestinationSelected;

  const SidebarWidget({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      width: 272,
      child: Material(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.only(top: 25, left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/TWNSQR.png',
                width: 156,
                height: 43,
              ),
              const SizedBox(height: 30),
              ...items.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;

                return GestureDetector(
                  onTap: () => onDestinationSelected(ref, index),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 209,
                          decoration: BoxDecoration(
                            borderRadius: index == 4
                                ? BorderRadius.circular(25)
                                : BorderRadius.circular(10),
                            color: index == 4
                                ? CustomColors.primary[300]
                                : index == currentIndex
                                    ? CustomColors.neutral[900]
                                    : Colors.transparent,
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Image.asset(
                                item.iconPath,
                                width: 24,
                                height: 24,
                                color: index == 4
                                    ? Colors.black
                                    : index == currentIndex
                                        ? CustomColors.primary[400]
                                        : Colors.white,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                item.name,
                                style: TextStyle(
                                  color: index == 4
                                      ? Colors.black
                                      : index == currentIndex
                                          ? CustomColors.primary[400]
                                          : Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (index == currentIndex)
                          const Positioned(
                            right: -15,
                            top: 20,
                            child: CustomRightIndicator(),
                          ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomRightIndicator extends StatelessWidget {
  const CustomRightIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(12, 12),
      painter: _RightIndicatorPainter(),
    );
  }
}

class _RightIndicatorPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = CustomColors.primary[400]!
      ..style = PaintingStyle.fill;

    const double radius = 6.0;
    final Offset center = Offset(size.width / 2, size.height / 2);

    // Dibuja un medio círculo
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      3.14 / 2,
      3.14,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
