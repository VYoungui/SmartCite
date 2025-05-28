import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData _buildTheme({required Brightness brightness, required AppColors colors}) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: colors.background,
      textTheme: _buildTextTheme(colors: colors),
      appBarTheme: AppBarTheme(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: brightness == Brightness.light ? Brightness.dark : Brightness.light,
        ),
        titleTextStyle: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: colors.onBackground,
        ),
        iconTheme: IconThemeData(
          color: colors.onBackground,
        ),
        backgroundColor: Colors.transparent,
      ),
      drawerTheme: DrawerThemeData(backgroundColor: colors.background),
      cardColor: colors.background,
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: colors.background),
      dialogTheme: DialogTheme(backgroundColor: colors.background),
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: colors.primary.withAlpha(75),
        surfaceTintColor: Colors.transparent,
        backgroundColor: colors.background,
        elevation: 3.0,
        iconTheme: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return IconThemeData(color: colors.primary);
            }

            return IconThemeData(color: colors.onBackground);
          },
        ),
      ),
      primaryColor: colors.primary,
      colorScheme: ColorScheme(
        primary: colors.primary,
        onPrimary: colors.onPrimary,
        surface: colors.surface,
        onSurface: colors.onSurface,
        secondary: colors.secondary,
        onSecondary: colors.onSecondary,
        error: colors.error,
        brightness: brightness,
        onError: colors.onError,

      ),
      datePickerTheme: const DatePickerThemeData(
        weekdayStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
        dayStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
      ),
    );
  }

  static TextTheme _buildTextTheme({required AppColors colors}) {
    return TextTheme(
      headlineLarge: GoogleFonts.poppins(
        fontSize: 34,
        fontWeight: FontWeight.bold,
        color: colors.onBackground,
      ),
      bodyLarge: GoogleFonts.raleway(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: colors.onBackground,
      ),
      bodyMedium: GoogleFonts.poppins( //for secondary button
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: colors.onSecondary,
      ),
      bodySmall: GoogleFonts.poppins( //for primary button
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: colors.onPrimary,
      ),
      titleLarge: GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: colors.onBackground,
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: colors.onBackground,
      ),
      titleSmall: GoogleFonts.poppins( //For button
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: colors.onError,
      ),
    );
  }

  static final ThemeData lightTheme = _buildTheme(
    brightness: Brightness.light,
    colors: AppColors.light(),
  );

  static final ThemeData darkTheme = _buildTheme(
    brightness: Brightness.dark,
    colors: AppColors.dark(),
  );
}
