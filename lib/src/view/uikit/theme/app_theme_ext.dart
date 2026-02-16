import 'package:flutter/material.dart';
import 'app_colors.dart';

@immutable
class AppThemeExt extends ThemeExtension<AppThemeExt> {
  final Color surfaceAlt;
  final Color border;
  final Color retroShadow;

  /// “Retro shadow”: 1–2px offset, no blur.
  final List<BoxShadow> retroShadow1;
  final List<BoxShadow> retroShadow2;

  const AppThemeExt({
    required this.surfaceAlt,
    required this.border,
    required this.retroShadow,
    required this.retroShadow1,
    required this.retroShadow2,
  });

  factory AppThemeExt.fromTokens() => AppThemeExt(
        surfaceAlt: AppColors.surfaceAlt,
        border: AppColors.border,
        retroShadow: AppColors.shadow,
        retroShadow1: const [
          BoxShadow(
            color: AppColors.shadow,
            offset: Offset(1, 1),
            blurRadius: 0,
            spreadRadius: 0,
          ),
        ],
        retroShadow2: const [
          BoxShadow(
            color: AppColors.shadow,
            offset: Offset(2, 2),
            blurRadius: 0,
            spreadRadius: 0,
          ),
        ],
      );

  @override
  AppThemeExt copyWith({
    Color? surfaceAlt,
    Color? border,
    Color? retroShadow,
    List<BoxShadow>? retroShadow1,
    List<BoxShadow>? retroShadow2,
  }) {
    return AppThemeExt(
      surfaceAlt: surfaceAlt ?? this.surfaceAlt,
      border: border ?? this.border,
      retroShadow: retroShadow ?? this.retroShadow,
      retroShadow1: retroShadow1 ?? this.retroShadow1,
      retroShadow2: retroShadow2 ?? this.retroShadow2,
    );
  }

  @override
  AppThemeExt lerp(ThemeExtension<AppThemeExt>? other, double t) {
    if (other is! AppThemeExt) return this;
    return AppThemeExt(
      surfaceAlt: Color.lerp(surfaceAlt, other.surfaceAlt, t)!,
      border: Color.lerp(border, other.border, t)!,
      retroShadow: Color.lerp(retroShadow, other.retroShadow, t)!,
      retroShadow1: t < 0.5 ? retroShadow1 : other.retroShadow1,
      retroShadow2: t < 0.5 ? retroShadow2 : other.retroShadow2,
    );
  }
}

extension AppThemeX on BuildContext {
  AppThemeExt get appTheme => Theme.of(this).extension<AppThemeExt>()!;
}
