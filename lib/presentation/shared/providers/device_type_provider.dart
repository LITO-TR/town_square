import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Enum para los tipos de dispositivos
enum DeviceType { mobile, desktop }

final deviceTypeProvider = Provider<DeviceType>((ref) {
  final screenWidth = WidgetsBinding.instance.window.physicalSize.width;

  if (screenWidth < 800) {
    return DeviceType.mobile;
  } else {
    return DeviceType.desktop;
  }
});
