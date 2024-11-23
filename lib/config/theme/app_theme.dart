import 'package:flutter/material.dart';
import 'package:town_square/config/theme/custom_colors.dart';

class AppTheme {
  final TextTheme textTheme;

  AppTheme({required this.textTheme});
  ThemeData getLightTheme() => ThemeData(
        brightness: Brightness.light,
        fontFamily: 'SFProDisplay',
        scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        unselectedWidgetColor: CustomColors.primary,
        colorScheme: const ColorScheme.light(
          primary: CustomColors.primary,
        ),
        appBarTheme: const AppBarTheme(
          color: CustomColors.primary,
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0.0,
        ),
        sliderTheme: const SliderThemeData(
          trackHeight: 4,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 5),
        ),
        iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
            iconColor: WidgetStatePropertyAll(Colors.black),
            backgroundColor: WidgetStatePropertyAll(Colors.transparent),
          ),
        ),
        textTheme: textTheme,
      );
  ThemeData getDarkTheme() => ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Ubuntu',
        scaffoldBackgroundColor: CustomColors.scaffoldBackgroundColorDarkMode,
        unselectedWidgetColor: CustomColors.primary,
        colorScheme: const ColorScheme.dark(
          primary: CustomColors.primary,
        ),
        sliderTheme: const SliderThemeData(
          trackHeight: 4,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 5),
        ),
        iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
            iconColor: WidgetStatePropertyAll(Colors.white),
            backgroundColor: WidgetStatePropertyAll(Colors.transparent),
          ),
        ),
        textTheme: textTheme,
      );
}
