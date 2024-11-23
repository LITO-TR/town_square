import 'package:flutter/material.dart';
import 'package:town_square/config/theme/custom_colors.dart';

class DashedLineWithTitlesWidget extends StatelessWidget {
  final int activitiesCount;
  final bool isDark;

  const DashedLineWithTitlesWidget({
    super.key,
    required this.activitiesCount,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(
        20,
        activitiesCount == 0
            ? 100
            : (MediaQuery.of(context).size.height * 0.17) * activitiesCount + 0,
      ),
      painter: DashedLineWithTitlesPainter(
        isDark: isDark,
        activitiesCount: activitiesCount,
      ),
    );
  }
}

class DashedLineWithTitlesPainter extends CustomPainter {
  final int activitiesCount;
  final bool isDark;

  DashedLineWithTitlesPainter({
    required this.isDark,
    required this.activitiesCount,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = CustomColors.neutral[300]!
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const dashWidth = 5.0;
    const dashSpace = 3.0;
    double startY = 0;

    // line
    while (startY < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, startY),
        Offset(size.width / 2, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashSpace;
    }

    // circle
    canvas.drawCircle(
      Offset(size.width / 2, 0),
      5.0, // Radio
      Paint()..color = CustomColors.secondary[300]!,
    );

    canvas.drawCircle(
      Offset(size.width / 2, size.height),
      5.0, // Radio
      Paint()..color = CustomColors.secondary[300]!,
    );

    // titles
    final todayTitlePainter = TextPainter(
      text: TextSpan(
        text: "Today",
        style: TextStyle(
          color: isDark ? Colors.white : Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    todayTitlePainter.layout();
    todayTitlePainter.paint(
      canvas,
      Offset(size.width / 2 + 10, -7),
    );

    final tomorrowTitlePainter = TextPainter(
      text: TextSpan(
        text: "Tomorrow",
        style: TextStyle(
          color: isDark ? Colors.white : Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    tomorrowTitlePainter.layout();
    tomorrowTitlePainter.paint(
      canvas,
      Offset(size.width / 2 + 10, size.height - 7),
    );

    // subtitle
    final todaySubTextPainter = TextPainter(
      text: const TextSpan(
        text: "/tuesday",
        style: TextStyle(
          color: CustomColors.neutral,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    todaySubTextPainter.layout();
    todaySubTextPainter.paint(
      canvas,
      Offset(size.width / 2 + 10 + todayTitlePainter.width + 8, -5),
    );

    final tomorrowSubTextPainter = TextPainter(
      text: const TextSpan(
        text: "Wednesday",
        style: TextStyle(
          color: CustomColors.neutral,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    tomorrowSubTextPainter.layout();
    tomorrowSubTextPainter.paint(
      canvas,
      Offset(size.width / 2 + 10 + tomorrowTitlePainter.width + 8,
          size.height - 5),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
