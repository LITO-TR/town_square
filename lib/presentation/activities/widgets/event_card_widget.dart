import 'package:flutter/material.dart';
import 'package:town_square/config/theme/custom_colors.dart';

class EventCardWidget extends StatelessWidget {
  const EventCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      decoration: BoxDecoration(
          color: CustomColors.secondary[200],
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text("Weekly workshops\nfor kids",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Text(
              "Sign up for early access to weekly activities\n for your kids full of learning and fun!",
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Learn More",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                    Icon(
                      Icons.arrow_circle_right_outlined,
                      color: Colors.black,
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
