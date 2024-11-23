import 'package:flutter/material.dart';
import 'package:town_square/config/theme/custom_colors.dart';

class CustomButtonJoinWidget extends StatefulWidget {
  final bool isDark;

  const CustomButtonJoinWidget({super.key, required this.isDark});

  @override
  CustomButtonJoinWidgetState createState() => CustomButtonJoinWidgetState();
}

class CustomButtonJoinWidgetState extends State<CustomButtonJoinWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
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
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.isDark
                ? Colors.white
                : (_isHovered ? CustomColors.neutral : Colors.black),
            foregroundColor: widget.isDark
                ? Colors.black
                : (_isHovered ? Colors.black : Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          ),
          onPressed: () {
            debugPrint("Unirse a la actividad");
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text("Join"),
          ),
        ),
      ),
    );
  }
}
