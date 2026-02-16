import 'i_game_view_model.dart';

class MockGameViewModel implements IGameViewModel {
  @override
  final String title;

  @override
  final String console;

  @override
  final String releaseYear;

  @override
  final int price;

  @override
  final bool isFavorite;

  const MockGameViewModel({
    required this.title,
    required this.console,
    required this.releaseYear,
    required this.price,
    required this.isFavorite,
  });

  factory MockGameViewModel.demo({
    required String title,
    required String console,
    required String releaseYear,
    required int price,
    bool isFavorite = false,
  }) {
    return MockGameViewModel(
      title: title,
      console: console,
      releaseYear: releaseYear,
      price: price,
      isFavorite: isFavorite,
    );
  }
}
