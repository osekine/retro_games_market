import 'i_game_view_model.dart';
import 'i_main_view_model.dart';
import 'i_user_profile_view_model.dart';
import 'mock_game_view_model.dart';
import 'mock_user_profile_view_model.dart';

class MockMainViewModel implements IMainViewModel {
  @override
  final List<IGameViewModel> games;

  @override
  final IUserProfileViewModel user;

  const MockMainViewModel({required this.games, required this.user});

  factory MockMainViewModel.demo() {
    return MockMainViewModel(
      user: MockUserProfileViewModel.demo(),
      games: [
        MockGameViewModel.demo(
          title: 'Super Mario Bros.',
          console: 'NES',
          releaseYear: '1985',
          price: 1500,
          isFavorite: true,
        ),
        MockGameViewModel.demo(
          title: 'The Legend of Zelda',
          console: 'NES',
          releaseYear: '1986',
          price: 2000,
        ),
        MockGameViewModel.demo(
          title: 'Sonic the Hedgehog',
          console: 'SEGA Genesis',
          releaseYear: '1991',
          price: 180,
          isFavorite: true,
        ),
        MockGameViewModel.demo(
          title: 'Street Fighter II',
          console: 'SNES',
          releaseYear: '1991',
          price: 25,
        ),
      ],
    );
  }
}
