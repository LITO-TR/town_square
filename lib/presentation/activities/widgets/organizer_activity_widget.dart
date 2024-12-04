import 'package:flutter/material.dart';
import 'package:town_square/config/theme/custom_colors.dart';

class OrganizerActivityWidget extends StatelessWidget {
  const OrganizerActivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage:
                  AssetImage('assets/images/organizer_profile.png'),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Ashfak Sayem'),
                Text('Organizer'),
              ],
            ),
          ],
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: CustomColors.primary[200],
            foregroundColor: CustomColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            minimumSize: const Size(0, 20),
          ),
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              "Follow",
            ),
          ),
        ),
      ],
    );
  }
}
