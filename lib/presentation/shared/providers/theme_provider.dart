import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:town_square/infrastructure/services/key_value_storage_service.dart';

import 'package:town_square/presentation/shared/providers/key_value_storage_provider.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, bool>(
  (ref) {
    final keyValueStorageService = ref.read(keyValueStorageProvider);
    return ThemeNotifier(keyValueStorageService: keyValueStorageService);
  },
);

class ThemeNotifier extends StateNotifier<bool> {
  final KeyValueStorageService keyValueStorageService;
  ThemeNotifier({required this.keyValueStorageService}) : super(false) {
    _init();
  }

  void _init() async {
    bool? isDark = await keyValueStorageService.getValue<bool>("isDarkMode");

    if (isDark == null) {
      var brightness =
          SchedulerBinding.instance.platformDispatcher.platformBrightness;
      bool isDarkMode = brightness == Brightness.dark;
      state = isDarkMode ? true : false;
      await keyValueStorageService.setKeyValue<bool>("isDarkMode", state);
    } else {
      if (isDark) {
        state = true;
      } else {
        state = false;
      }
    }
  }

  void toggleTheme() async {
    await keyValueStorageService.setKeyValue<bool>("isDarkMode", !state);
    state = !state;
  }
}
