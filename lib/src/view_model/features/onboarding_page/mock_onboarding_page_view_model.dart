import 'i_onboarding_page_view_model.dart';

class MockOnboardingPageViewModel implements IOnboardingPageViewModel {
  @override
  final String title;

  @override
  final String body;

  const MockOnboardingPageViewModel({required this.title, required this.body});

  factory MockOnboardingPageViewModel.demo({
    required String title,
    required String body,
  }) {
    return MockOnboardingPageViewModel(title: title, body: body);
  }
}
