import 'package:retro_games_market/src/view_model/features/main_page/i_game_view_model.dart';
import 'package:retro_games_market/src/view_model/features/main_page/i_user_profile_view_model.dart';

abstract interface class IMainViewModel {
  List<IGameViewModel> get games;
  IUserProfileViewModel get user;
}
