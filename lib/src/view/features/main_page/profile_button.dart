import 'package:flutter/material.dart';
import 'package:retro_games_market/src/view/uikit/theme/theme.dart';

class ProfileButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const ProfileButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final t = context.appTheme;

    return Padding(
      padding: const EdgeInsets.all( 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: t.border, width: 1),
          boxShadow: t.retroShadow1,
        ),
        child: Material(
          type: MaterialType.transparency,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              Icons.person_outline,
              size: 24,
              color: AppColors.border,
            ),
          ),
        ),
      ),
    );
  }
}
