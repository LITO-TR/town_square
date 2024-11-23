import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:town_square/config/theme/custom_colors.dart';
import 'package:town_square/presentation/shared/providers/theme_provider.dart';
import 'package:town_square/presentation/shared/widgets/sidebar_item_widget.dart';

class SidebarWidget extends ConsumerWidget {
  final Function(int) goBranch;
  final bool themePv;

  const SidebarWidget({
    super.key,
    required this.goBranch,
    required this.themePv,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    const colorOptions = Colors.white;

    return Padding(
      padding: const EdgeInsets.only(right: 30.0),
      child: Container(
        width: 270,
        height: size.height * 1,
        color: Colors.black,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          children: [
            Image.asset(
              width: 10,
              'assets/images/TWNSQR.png',
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            SidebarItemWidget(
              icon: Icons.calendar_today_outlined,
              text: 'Activities',
              onTap: () => goBranch(0),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            SidebarItemWidget(
              icon: Icons.map_outlined,
              text: 'Locations',
              onTap: () => goBranch(1),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            SidebarItemWidget(
              icon: Icons.star_border_outlined,
              text: 'Services',
              onTap: () => goBranch(2),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            SidebarItemWidget(
              icon: Icons.people_alt_outlined,
              text: 'Comunities',
              onTap: () => goBranch(3),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            SidebarItemWidget(
              icon: Icons.star_outline_outlined,
              text: 'Notifications',
              onTap: () => goBranch(4),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            FilledButton(
              style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all<Color>(CustomColors.primary[600]!),
              ),
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 20,
                    ),
                    SizedBox(width: 30),
                    Text(
                      'Create',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.yellow,
                ),
                const Text(
                  'Profile',
                  style: TextStyle(fontSize: 20, color: colorOptions),
                ),
                IconButton(
                  onPressed: () {
                    ref.read(themeProvider.notifier).toggleTheme();
                  },
                  icon: const Icon(
                    Icons.more_vert_outlined,
                    color: colorOptions,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
