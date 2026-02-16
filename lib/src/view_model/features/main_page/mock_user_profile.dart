import 'i_user_profile.dart';

class MockUserProfile implements IUserProfile {
  @override
  final String name;

  @override
  final String picture;

  const MockUserProfile({required this.name, required this.picture});

  factory MockUserProfile.demo() {
    return const MockUserProfile(
      name: 'Player One',
      picture: 'https://i.pravatar.cc/150?img=3',
    );
  }
}
