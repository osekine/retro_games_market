import 'i_user_profile_view_model.dart';

class MockUserProfileViewModel implements IUserProfileViewModel {
  @override
  final String name;

  @override
  final String picture;

  const MockUserProfileViewModel({required this.name, required this.picture});

  factory MockUserProfileViewModel.demo() {
    return const MockUserProfileViewModel(
      name: 'Player One',
      picture: 'https://i.pravatar.cc/150?img=3',
    );
  }
}
