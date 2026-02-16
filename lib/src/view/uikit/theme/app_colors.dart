import 'package:flutter/material.dart';

/// Raw palette from designer (single source of truth).
abstract final class AppColors {
  static const bg = Color(0xFF969D7B);
  static const surface = Color(0xFF8F9671);
  static const surfaceAlt = Color(0xFF7F8665);

  static const border = Color(0xFF24290F);

  // shadow at 20% opacity
  static const shadow = Color(0x331A1E0B); // 0x33 = ~20%

  static const textPrimary = Color(0xFF24290F);
  static const textSecondary = Color(0xFF3A4220);
  static const textDisabled = Color(0xFF5F6746);

  static const accent = Color(0xFF3F5378);
  static const onAccent = Color(0xFFE9EBDD);

  static const error = Color(0xFF6B2E24);
  static const success = Color(0xFF2F5A2D);
}
