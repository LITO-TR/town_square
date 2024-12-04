import 'package:flutter/material.dart';
import 'package:town_square/config/theme/custom_colors.dart';

class TopIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _TopIndicatorBox();
  }
}

class _TopIndicatorBox extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    Paint paint = Paint()
      ..color = CustomColors.primary[400]!
      ..strokeWidth = 5
      ..isAntiAlias = true;
    const double radius = 6.0;
    final Offset circleOffset = Offset(cfg.size!.width / 2 + offset.dx, 0);
    canvas.drawArc(
      Rect.fromCircle(center: circleOffset, radius: radius),
      0,
      3.14,
      false,
      paint,
    );
  }
}
