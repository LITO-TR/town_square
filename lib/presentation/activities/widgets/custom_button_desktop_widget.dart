import 'package:flutter/material.dart';
import 'package:town_square/config/theme/custom_colors.dart';

class CustomButtonDesktopWidget extends StatefulWidget {
  final String title;
  final void Function() onPressed;

  const CustomButtonDesktopWidget(
      {super.key, required this.title, required this.onPressed});

  @override
  CustomButtonDesktopWidgetState createState() =>
      CustomButtonDesktopWidgetState();
}

class CustomButtonDesktopWidgetState extends State<CustomButtonDesktopWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: _isHovered ? CustomColors.neutral : Colors.black,
            foregroundColor: _isHovered ? Colors.black : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            minimumSize: const Size(0, 22),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              widget.title,
              style: textTheme.bodySmall?.copyWith(
                  color: _isHovered ? Colors.black : Colors.white,
                  fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }
}
