import 'package:flutter/material.dart';
import 'package:retro_games_market/src/view/uikit/theme/theme.dart';

class PageDotsIndicator extends StatelessWidget {
  final int count;
  final int index;

  const PageDotsIndicator({
    super.key,
    required this.count,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.appTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final selected = i == index;
        return Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: selected ? AppColors.accent : AppColors.surfaceAlt,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: t.border, width: 1),
            boxShadow: selected ? t.retroShadow1 : const [],
          ),
        );
      }),
    );
  }
}
