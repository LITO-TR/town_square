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

    return Padding(
      padding: const EdgeInsets.only(right: 30.0),
      child: Container(
        width: 272,
        height: size.height * 1,
        color: Colors.black,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          children: [
            Image.asset(
              'assets/images/TWNSQR.png',
              width: 156,
              height: 43,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.png'),
                backgroundColor: Colors.yellow,
                radius: 15,
              ),
              title: const Text(
                '  Profile',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              trailing: InkWell(
                onTap: () {
                  ref.read(themeProvider.notifier).toggleTheme();
                },
                child: const Icon(
                  Icons.more_vert_outlined,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
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
              icon: Icons.star_border_outlined,
              text: 'Services',
              onTap: () => goBranch(2),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            SidebarItemWidget(
              icon: Icons.people_alt_outlined,
              text: 'People',
              onTap: () => goBranch(3),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: FilledButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                      CustomColors.primary[300]!),
                ),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Create',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
