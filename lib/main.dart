import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:town_square/config/router/app_router.dart';
import 'package:town_square/config/theme/app_theme.dart';
import 'package:town_square/config/theme/custom_text_theme.dart';
import 'package:town_square/presentation/shared/providers/device_type_provider.dart';
import 'package:town_square/presentation/shared/providers/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themePv = ref.watch(themeProvider);
    final deviceTypePv = ref.watch(deviceTypeProvider);

    final appRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Town Square',
      theme: _getThemeForDeviceAndMode(deviceTypePv, themePv),
      routerConfig: appRouter,
    );
  }
}

ThemeData _getThemeForDeviceAndMode(DeviceType deviceTypePv, bool isDarkMode) {
  switch (deviceTypePv) {
    case DeviceType.mobile:
      return isDarkMode
          ? AppTheme(textTheme: textThemeMobile).getDarkTheme()
          : AppTheme(textTheme: textThemeMobile).getLightTheme();
    case DeviceType.desktop:
      return isDarkMode
          ? AppTheme(textTheme: textThemeDesktop).getDarkTheme()
          : AppTheme(textTheme: textThemeDesktop).getLightTheme();
    default:
      return isDarkMode
          ? AppTheme(textTheme: textThemeMobile).getDarkTheme()
          : AppTheme(textTheme: textThemeMobile).getLightTheme();
  }
}
