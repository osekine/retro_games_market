import 'package:flutter/material.dart';
import 'package:retro_games_market/src/view/uikit/theme/app_colors.dart';
import 'package:retro_games_market/src/view/uikit/theme/app_theme_ext.dart';

class OnboardingIllustrationCard extends StatelessWidget {
  const OnboardingIllustrationCard({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.appTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: t.border, width: 1),
          boxShadow: t.retroShadow2,
        ),
        child: const Center(
          child: Icon(
            Icons.videogame_asset_outlined,
            size: 96,
            color: AppColors.border,
          ),
        ),
      ),
    );
  }
}
