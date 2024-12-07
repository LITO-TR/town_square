import 'package:flutter/material.dart';
import 'package:town_square/config/theme/custom_colors.dart';

class UploadImageWidget extends StatelessWidget {
  const UploadImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Stack(
      children: [
        Container(
          height: size.height * 0.4,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: AssetImage('assets/images/create_event.png'),
              fit: BoxFit.fill,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x1F000000),
                offset: Offset(3, 3),
                blurRadius: 8,
                spreadRadius: 0,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  color: CustomColors.neutral[900],
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                width: 32,
                height: 32,
                'assets/images/image_back.png',
                color: Colors.white,
              )),
        ),
      ],
    );
  }
}
