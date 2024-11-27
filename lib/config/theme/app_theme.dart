import 'package:flutter/material.dart';
import 'package:town_square/config/theme/custom_colors.dart';

class AppTheme {
  final TextTheme textTheme;

  AppTheme({required this.textTheme});
  ThemeData getLightTheme() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        fontFamily: 'SFProDisplay',
        scaffoldBackgroundColor: CustomColors.scaffoldBackgroundColorLigthMode,
        textTheme: textTheme.copyWith(
          displayLarge: textTheme.displayLarge!.copyWith(color: Colors.black),
          displayMedium: textTheme.displayMedium!.copyWith(color: Colors.black),
          titleLarge: textTheme.titleLarge!.copyWith(color: Colors.black),
          titleMedium: textTheme.titleMedium!.copyWith(color: Colors.black),
          bodyLarge: textTheme.bodyLarge!.copyWith(color: Colors.black),
          bodyMedium: textTheme.bodyMedium!.copyWith(color: Colors.black),
          bodySmall: textTheme.bodySmall!.copyWith(color: Colors.black),
        ),
      );

  ThemeData getDarkTheme() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        fontFamily: 'SFProDisplay',
        scaffoldBackgroundColor: CustomColors.scaffoldBackgroundColorDarkMode,
        textTheme: textTheme.copyWith(
          displayLarge: textTheme.displayLarge!.copyWith(color: Colors.white),
          displayMedium: textTheme.displayMedium!.copyWith(color: Colors.white),
          titleLarge: textTheme.titleLarge!.copyWith(color: Colors.white),
          titleMedium: textTheme.titleMedium!.copyWith(color: Colors.white),
          bodyLarge: textTheme.bodyLarge!.copyWith(color: Colors.white),
          bodyMedium: textTheme.bodyMedium!.copyWith(color: Colors.white),
          bodySmall: textTheme.bodySmall!.copyWith(color: Colors.white),
        ),
      );
}
