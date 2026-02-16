import 'package:flutter/material.dart';
import 'package:retro_games_market/src/view_model/features/main_page/i_game_view_model.dart';

class GameTile extends StatelessWidget {
  final IGameViewModel vm;
  const GameTile({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Placeholder(),
            Column(
              children: [
                TitleText(vm.title),
                SubtitleText('${vm.console} • ${vm.releaseYear}'),
                Row(
                  children: [
                    BuyButton('${vm.price ~/ 100}.${vm.price % 100}'),
                    LikeButton(vm.isFavorite),
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

class TitleText extends StatelessWidget {
  final String text;
  const TitleText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class SubtitleText extends StatelessWidget {
  final String text;
  const SubtitleText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class BuyButton extends StatelessWidget {
  final String price;
  const BuyButton(this.price, {super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class LikeButton extends StatelessWidget {
  final bool isLiked;
  const LikeButton(this.isLiked, {super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
