import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_theme_ext.dart';

abstract final class AppTheme {
  static ThemeData light() {
    final ext = AppThemeExt.fromTokens();
    final base = ThemeData.light();

    final colorScheme = const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.accent,
      onPrimary: AppColors.onAccent,
      secondary: AppColors.accent,
      onSecondary: AppColors.onAccent,
      surface: AppColors.surface,
      onSurface: AppColors.textPrimary,
      error: AppColors.error,
      onError: AppColors.onAccent,
    );

    final textTheme = base.textTheme.copyWith(
      displayLarge: const TextStyle(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: const TextStyle(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w700,
      ),
      displaySmall: const TextStyle(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w700,
      ),

      headlineLarge: const TextStyle(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: const TextStyle(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: const TextStyle(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w700,
      ),

      titleLarge: const TextStyle(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: const TextStyle(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: const TextStyle(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w600,
      ),

      bodyLarge: const TextStyle(color: AppColors.textPrimary),
      bodyMedium: const TextStyle(color: AppColors.textPrimary),
      bodySmall: const TextStyle(color: AppColors.textSecondary),

      labelLarge: const TextStyle(
        color: AppColors.onAccent,
        fontWeight: FontWeight.w700,
      ),
      labelMedium: const TextStyle(color: AppColors.textPrimary),
      labelSmall: const TextStyle(color: AppColors.textSecondary),
    );

    return base.copyWith(
      useMaterial3: false,

      colorScheme: colorScheme,

      // Backgrounds
      scaffoldBackgroundColor: AppColors.bg,
      canvasColor: AppColors.bg,

      // Text / icons
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      iconTheme: const IconThemeData(color: AppColors.border),
      disabledColor: AppColors.textDisabled,

      // Dividers
      dividerColor: AppColors.border,
      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: 1,
        space: 1,
      ),

      // AppBar (Material 2)
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.bg,
        elevation: 0,
        foregroundColor: AppColors.textPrimary,
        iconTheme: IconThemeData(color: AppColors.border),
        actionsIconTheme: IconThemeData(color: AppColors.border),
      ),

      // Cards (elevation=0, ретро-тень рисуем вручную)
      cardColor: AppColors.surface,
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: AppColors.border, width: 1),
        ),
      ),

      // Inputs
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ext.surfaceAlt,
        hintStyle: const TextStyle(color: AppColors.textSecondary),
        labelStyle: const TextStyle(color: AppColors.textSecondary),
        floatingLabelStyle: const TextStyle(color: AppColors.textPrimary),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.accent, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
      ),

      // Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: AppColors.onAccent,
          disabledBackgroundColor: ext.surfaceAlt,
          disabledForegroundColor: AppColors.textDisabled,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: AppColors.border, width: 1),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.textPrimary,
          side: const BorderSide(color: AppColors.border, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.accent,
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.accent,
        foregroundColor: AppColors.onAccent,
      ),

      // Selection controls (задают “accent” корректно без устаревших полей)
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) return ext.surfaceAlt;
          if (states.contains(MaterialState.selected)) return AppColors.accent;
          return Colors.transparent;
        }),
        checkColor: MaterialStateProperty.all(AppColors.onAccent),
        side: const BorderSide(color: AppColors.border, width: 1),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled))
            return AppColors.textDisabled;
          if (states.contains(MaterialState.selected)) return AppColors.accent;
          return AppColors.border;
        }),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled))
            return AppColors.textDisabled;
          if (states.contains(MaterialState.selected))
            return AppColors.onAccent;
          return ext.surfaceAlt;
        }),
        trackColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) return ext.surfaceAlt;
          if (states.contains(MaterialState.selected)) return AppColors.accent;
          return AppColors.border;
        }),
      ),

      // Cursor / selection
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.accent,
        selectionHandleColor: AppColors.accent,
        selectionColor: Color(0x553F5378),
      ),

      // Theme extensions (surfaceAlt/border/retro shadows)
      extensions: <ThemeExtension<dynamic>>[ext],
    );
  }
}
