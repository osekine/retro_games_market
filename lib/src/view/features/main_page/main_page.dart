import 'package:flutter/material.dart';
import 'package:retro_games_market/src/view/uikit/theme/app_colors.dart';
import 'package:retro_games_market/src/view_model/features/main_page/i_main_view_model.dart';

import 'profile_button.dart';
import 'game_tile.dart';
import 'large_title_text.dart';

class MainPage extends StatelessWidget {
  final IMainViewModel vm;
  const MainPage({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        title: LargeTitleText('GAME_SHOP'),
        actions: [const ProfileButton()],
      ),
      body: ListView.builder(
        itemCount: vm.games.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: GameTile(vm: vm.games[index]),
        ),
      ),
    );
  }
}
