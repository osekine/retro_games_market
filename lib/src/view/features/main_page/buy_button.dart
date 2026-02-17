import 'package:flutter/material.dart';
import 'package:retro_games_market/src/view/uikit/widgets/widgets.dart';
import 'package:retro_games_market/src/view/uikit/theme/theme.dart';

class BuyButton extends StatelessWidget {
  final String priceText;
  final VoidCallback? onPressed;

  const BuyButton(this.priceText, {super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final t = context.appTheme;

    return RetroButton(
      label: priceText,
      onPressed: onPressed,
      background: AppColors.accent,
      foreground: AppColors.onAccent,
      borderColor: t.border,
      shadow: t.retroShadow1,
      icon: Icons.shopping_cart_outlined,
    );
  }
}
