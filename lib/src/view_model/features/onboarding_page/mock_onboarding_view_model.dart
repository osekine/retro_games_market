import 'i_onboarding_page_view_model.dart';
import 'i_onboarding_view_model.dart';
import 'mock_onboarding_page_view_model.dart';

class MockOnboardingViewModel implements IOnboardingViewModel {
  @override
  final List<IOnboardingPageViewModel> pages;

  const MockOnboardingViewModel({required this.pages});

  factory MockOnboardingViewModel.demo() {
    return MockOnboardingViewModel(
      pages: const [
        MockOnboardingPageViewModel(
          title: 'Коллекция хитов 80–00х',
          body:
              'Откройте редкие издания, переиздания и культовые игры с консолей прошлого.',
        ),
        MockOnboardingPageViewModel(
          title: 'Сохраняй прогресс',
          body:
              'Избранное, покупки и облако — всё под рукой, на любом устройстве.',
        ),
      ],
    );
  }
}
