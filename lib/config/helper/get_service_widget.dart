import 'package:flutter/material.dart';
import 'package:town_square/config/theme/custom_colors.dart';

Widget getServiceWidget(String service, TextTheme textTheme) {
  final Map<String, Color> serviceColors = {
    'light': CustomColors.lightIntensity,
    'medium': CustomColors.mediumIntensity,
    'high': CustomColors.highIntensity,
    'veryHighIntensity': CustomColors.veryHighIntensity,
    'workspace': CustomColors.workSpaceTag,
    'childcare': CustomColors.childCareTag,
  };
  final Map<String, Color> titleServiceColors = {
    'light': CustomColors.lightIntensityTitle,
    'medium': CustomColors.mediumIntensityTitle,
    'high': CustomColors.highIntensityTitle,
    'veryHighIntensity': CustomColors.veryHighIntensityTitle,
    'workspace': CustomColors.workSpaceTagTitle,
    'childcare': CustomColors.childCareTagTitle,
  };
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(2),
      color: serviceColors[service] ?? CustomColors.neutral[200],
    ),
    child: Text(
      service,
      style: textTheme.bodySmall?.copyWith(
          color: titleServiceColors[service],
          fontWeight: FontWeight.w700,
          fontSize: 10),
    ),
  );
}
