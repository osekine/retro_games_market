import 'package:retro_games_market/src/view_model/features/main_page/i_game_view_model.dart';
import 'package:retro_games_market/src/view_model/features/main_page/i_user_profile.dart';

abstract interface class IMainViewModel {
  List<IGameViewModel> get games;
  IUserProfile get user;
}
