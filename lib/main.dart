import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themePv = ref.watch(themeProvider);
    final deviceTypePv = ref.watch(deviceTypeProvider);
    final textTheme = Theme.of(context).textTheme;
    //  final appRouter = ref.watch(goRouterProvider);

    return MaterialApp(
      title: 'Town Square',
      theme: _getThemeForDeviceAndMode(deviceTypePv, themePv),
      home: Scaffold(
        appBar: AppBar(title: const Text('Test de Textos Personalizados')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Usamos el texto con las fuentes personalizadas
              Text('Texto Display Large', style: textTheme.displayLarge),
              Text('Texto Display Medium', style: textTheme.displayMedium),
              Text('Texto Title Large', style: textTheme.titleLarge),
              Text('Texto Body Large', style: textTheme.bodyLarge),
            ],
          ),
        ),
      ),
    );

//
  }
}

ThemeData _getThemeForDeviceAndMode(DeviceType deviceTypePv, bool isDarkMode) {
  // Elige el tema según el tipo de dispositivo y el modo oscuro
  switch (deviceTypePv) {
    case DeviceType.mobile:
      return isDarkMode
          ? AppTheme(textTheme: textThemeMobile).getDarkTheme()
          : AppTheme(textTheme: textThemeMobile).getLightTheme(); // Tema móvil
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
