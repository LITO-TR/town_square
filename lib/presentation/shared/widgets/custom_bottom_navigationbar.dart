import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:town_square/config/theme/custom_colors.dart';
import 'package:town_square/presentation/shared/providers/theme_provider.dart';
import 'package:town_square/presentation/shared/screens/home_screen.dart';

class CustomBottomNavigationbar extends ConsumerWidget {
  final List<HomeItem> items;
  final int currentIndex;
  final Function(WidgetRef, int) onDestinationSelected;
  const CustomBottomNavigationbar({
    super.key,
    required this.currentIndex,
    required this.items,
    required this.onDestinationSelected,
  });

  void onItemTapped(BuildContext context, int index, WidgetRef ref) {
    if (index >= 0 && index < items.length) {
      onDestinationSelected(ref, index);
    }
    //? to feature
    switch (index) {
      case 1:
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themePv = ref.watch(themeProvider);
    return BottomNavigationBar(
      backgroundColor: themePv ? Colors.black : Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      selectedLabelStyle: const TextStyle(fontSize: 0),
      unselectedLabelStyle: const TextStyle(fontSize: 0),
      onTap: (value) => onItemTapped(context, value, ref),
      elevation: 0,
      items: items.map((item) {
        return BottomNavigationBarItem(
          icon: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: themePv ? Colors.black : Colors.white),
            child: Image.asset(
              item.iconPath,
              width: 24,
              height: 24,
              color: themePv ? Colors.white : Colors.black,
            ),
          ),
          activeIcon: Column(
            children: [
              const CustomTopIndicator(),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: themePv
                        ? CustomColors.neutral[900]
                        : CustomColors.neutral[300]),
                child: Image.asset(
                  item.iconPath,
                  width: 24,
                  height: 24,
                  color: CustomColors.primary[400],
                ),
              ),
            ],
          ),
          label: item.name,
        );
      }).toList(),
    );
  }
}

class CustomTopIndicator extends StatelessWidget {
  const CustomTopIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -5,
      child: CustomPaint(
        size: const Size(12, 12),
        painter: _TopIndicatorPainter(),
      ),
    );
  }
}

class _TopIndicatorPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = CustomColors.primary[400]!
      ..strokeWidth = 5
      ..isAntiAlias = true;

    const double radius = 6.0;
    final Offset circleOffset = Offset(size.width / 2, 0);

    canvas.drawArc(
      Rect.fromCircle(center: circleOffset, radius: radius),
      0,
      3.14,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
