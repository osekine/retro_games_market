import 'package:flutter/material.dart';
import 'package:retro_games_market/src/view/features/main_page/game_tile.dart';
import 'package:retro_games_market/src/view_model/features/main_page/i_game_view_model.dart';
import 'package:retro_games_market/src/view_model/features/main_page/i_main_view_model.dart';
import 'package:retro_games_market/src/view/features/main_page/profile_button.dart';

class MyWidget extends StatelessWidget {
  final IMainViewModel vm;
  const MyWidget({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [const ProfileButton()]),
      body: ListView.builder(
        itemCount: vm.games.length,
        itemBuilder: (context, index) => GameTile(vm: vm.games[index]),
      ),
    );
  }
}
