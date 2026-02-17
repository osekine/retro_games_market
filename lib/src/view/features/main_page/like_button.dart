import 'package:flutter/material.dart';
import 'package:retro_games_market/src/view/uikit/theme/app_colors.dart';
import 'package:retro_games_market/src/view/uikit/theme/app_theme_ext.dart';

class LikeButton extends StatelessWidget {
  final bool isFavorite;
  final ValueChanged<bool>? onChanged;

  const LikeButton(this.isFavorite, {super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    final t = context.appTheme;

    final disabled = onChanged == null;
    final bg = isFavorite ? AppColors.accent : AppColors.surface;
    final fg =  AppColors.border;

    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: disabled ? AppColors.surfaceAlt : bg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: t.border, width: 1),
          boxShadow: disabled ? const [] : t.retroShadow1,
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: disabled ? null : () => onChanged!(!isFavorite),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.favorite_border,
                size: 20,
                color: disabled ? AppColors.textDisabled : fg,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
