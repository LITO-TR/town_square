import 'package:flutter/material.dart';
import 'package:town_square/config/theme/custom_colors.dart';
import 'package:town_square/domain/activity_entity.dart';

class FriendsContentActvDetailWidget extends StatelessWidget {
  const FriendsContentActvDetailWidget(
      {super.key, required this.size, required this.activity});

  final Size size;
  final ActivityEntity activity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.height * 0.27,
      left: size.width * 0.1,
      right: size.width * 0.1,
      child: Container(
        height: 51,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1F000000),
              offset: Offset(3, 3),
              blurRadius: 8,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundImage: AssetImage('assets/images/ellipse1.png'),
                    ),
                    Positioned(
                      left: 20,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundImage:
                            AssetImage('assets/images/ellipse2.png'),
                      ),
                    ),
                    Positioned(
                      left: 40,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundImage:
                            AssetImage('assets/images/ellipse3.png'),
                      ),
                    ),
                  ],
                ),
              ),
              Text('    +7 Going',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: CustomColors.primary[400])),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  minimumSize: const Size(0, 20),
                ),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Text(
                    "Invite",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
