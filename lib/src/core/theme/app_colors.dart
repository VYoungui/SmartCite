import 'package:flutter/material.dart';

class AppColors {
  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color error;
  final Color onError;
  final Color errorContainer;


  AppColors.light()
      : background = const Color(0xFFFFFFFF),
        onBackground = const Color(0xFF3E3E3E),
        surface = const Color(0xFFFFFFFF),
        onSurface = const Color(0xFF000000),
        secondary = const Color(0xFFf2faf1),
        onSecondary = const Color(0xFF81cc72),
        primary = const Color(0xFF81CD72),
        onPrimary = const Color(0xFFFFFFFF),
        error = const Color(0xFFF44336),
        errorContainer = const Color(0x33F44336),
        onError = const Color(0xFFFBFAF5);

  AppColors.dark()
      : background = const Color(0xFF11001c),
        onBackground = const Color(0xFFFBFAF5),
        surface = const Color(0xFF262626),
        onSurface = const Color(0xFFFBFAF5),
        secondary = const Color(0xFFC4C4C4),
        onSecondary = const Color(0xFF000000),
        primary = const Color(0xFFE164BE),
        onPrimary = const Color(0xFFFFFFFF),
        error = const Color(0xFFD50000),
        errorContainer = const Color(0xFFFF1744),
        onError = const Color(0xFFFBFAF5);
}
