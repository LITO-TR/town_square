import 'package:flutter/material.dart';

class BackgroundImageActvDetailWidget extends StatelessWidget {
  const BackgroundImageActvDetailWidget({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/portada.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
