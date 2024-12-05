import 'package:flutter/material.dart';
import 'package:town_square/config/theme/custom_colors.dart';

class EventCardWidget extends StatelessWidget {
  const EventCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      decoration: BoxDecoration(
          color: CustomColors.secondary[100],
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Connect with Marc",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Text(
              "Fellow Entrepreneur in Estepona -\nLets Grab a Coffee!",
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x1F000000),
                    offset: Offset(3, 3),
                    blurRadius: 8,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.white),
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
                        "Contact Now",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Colors.black),
                      ),
                      Icon(
                        Icons.arrow_circle_right_outlined,
                        color: Colors.black,
                        weight: 16,
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
