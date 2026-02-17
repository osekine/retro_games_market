import 'package:flutter/material.dart';
import 'package:retro_games_market/src/view/uikit/theme/app_colors.dart';
import 'package:retro_games_market/src/view/uikit/theme/app_theme_ext.dart';

class PaywallPlanCard extends StatelessWidget {
  final String tag; // MONTHLY / YEARLY
  final String title; // "Месяц" / "Год"
  final String price; // "€ X.XX"
  final String? chipText; // "SAVE 40%"
  final bool selected;
  final VoidCallback onTap;

  const PaywallPlanCard({
    super.key,
    required this.tag,
    required this.title,
    required this.price,
    required this.selected,
    required this.onTap,
    this.chipText,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.appTheme;

    return SizedBox(
      height: 88,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: selected ? AppColors.surfaceAlt : AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? AppColors.accent : t.border,
            width: selected ? 2 : 1,
          ),
          boxShadow: selected ? t.retroShadow2 : t.retroShadow1,
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Left block
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              tag,
                              style: Theme.of(context).textTheme.labelSmall
                                  ?.copyWith(
                                    color: AppColors.textSecondary,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.8,
                                  ),
                            ),
                            if (chipText != null) ...[
                              const SizedBox(width: 8),
                              _SaveChip(text: chipText!),
                            ],
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),

                  // Right price
                  Text(
                    price,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SaveChip extends StatelessWidget {
  final String text;
  const _SaveChip({required this.text});

  @override
  Widget build(BuildContext context) {
    final t = context.appTheme;

    return SizedBox(
      height: 24,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.accent,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: t.border, width: 1),
          boxShadow: t.retroShadow1,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.onAccent,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.4,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
