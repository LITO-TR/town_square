import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppBarWidget extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppBarWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(title, style: textTheme.displaySmall),
      centerTitle: false,
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_rounded,
              size: 32,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
