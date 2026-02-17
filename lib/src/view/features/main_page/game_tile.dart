import 'package:flutter/material.dart';
import 'package:retro_games_market/src/view/uikit/theme/theme.dart';
import 'package:retro_games_market/src/view_model/view_model.dart';

import 'buy_button.dart';
import 'like_button.dart';
import 'subtitle_text.dart';
import 'title_text.dart';

class GameTile extends StatelessWidget {
  final IGameViewModel vm;
  const GameTile({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    final t = context.appTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: t.border, width: 1),
        boxShadow: t.retroShadow2, // 2px offset ретро-тень
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Row(
          children: [
            SizedBox.square(dimension: 56, child: const Placeholder()),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TitleText(vm.title),
                SubtitleText('${vm.console} • ${vm.releaseYear}'),
                const SizedBox(height: 12),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BuyButton('${vm.price ~/ 100}.${vm.price % 100}'),
                    LikeButton(vm.isFavorite, onChanged: (_) {}),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
