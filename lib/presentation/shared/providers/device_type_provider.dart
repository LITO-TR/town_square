import 'package:flutter_riverpod/flutter_riverpod.dart';

enum DeviceType { mobile, desktop }

class DeviceTypeNotifier extends StateNotifier<DeviceType> {
  DeviceTypeNotifier() : super(DeviceType.mobile);

  void updateDeviceType(double width) {
    if (width < 1268) {
      state = DeviceType.mobile;
    } else {
      state = DeviceType.desktop;
    }
  }
}

final deviceTypeProvider =
    StateNotifierProvider<DeviceTypeNotifier, DeviceType>((ref) {
  return DeviceTypeNotifier();
});
