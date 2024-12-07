import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:town_square/presentation/create_event/views/create_event_desktop_view.dart';
import 'package:town_square/presentation/create_event/views/create_event_mobile_view.dart';
import 'package:town_square/presentation/shared/providers/device_type_provider.dart';

class CreateEventScreen extends ConsumerWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);
    final deviceType = ref.watch(deviceTypeProvider);

    return Scaffold(
      appBar:
          (deviceType == DeviceType.mobile) ? _buildAppBar(textTheme) : null,
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width * 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: deviceType == DeviceType.desktop
                ? const CreateEventDesktopView()
                : const CreateEventMobileView(),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(TextTheme textTheme) {
    return AppBar(
      title: Text('Create Event', style: textTheme.displaySmall),
      centerTitle: false,
    );
  }
}
