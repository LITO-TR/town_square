import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:town_square/presentation/profile/views/profile_desktop_view.dart';
import 'package:town_square/presentation/profile/views/profile_mobile_widget.dart';

import 'package:town_square/presentation/shared/providers/device_type_provider.dart';

import 'package:town_square/presentation/shared/widgets/custom_app_bar_widget.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceType = ref.watch(deviceTypeProvider);
    return Scaffold(
      appBar: deviceType == DeviceType.mobile
          ? const CustomAppBarWidget(title: 'Profile')
          : null,
      body: deviceType == DeviceType.mobile
          ? const ProfileMobileView()
          : const ProfileDesktopView(),
    );
  }
}
