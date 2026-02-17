import 'package:go_router/go_router.dart';
import 'package:retro_games_market/src/view/features/main_page/load_page.dart';
import 'package:retro_games_market/src/view/features/main_page/main_page.dart';
import 'package:retro_games_market/src/view/features/onboarding/onboarding_page.dart';
import 'package:retro_games_market/src/view/features/subscription/paywall_page.dart';
import 'package:retro_games_market/src/view/features/subscription/process_purchase_page.dart';
import 'package:retro_games_market/src/view_model/features/main_page/mock_main_view_model.dart';
import 'package:retro_games_market/src/view_model/features/onboarding_page/mock_onboarding_view_model.dart';

import 'app_startup_state.dart';

class AppRouter {
  static GoRouter create(AppStartupState startup) {
    return GoRouter(
      debugLogDiagnostics: true,
      refreshListenable: startup,
      initialLocation: '/',
      redirect: (context, state) {
        var loc = state.matchedLocation;

        bool isKnownRoute(String l) => const {
          '/',
          '/onboarding',
          '/paywall',
          '/processing',
          '/home',
        }.contains(l);

        if (!startup.isInitialized) return '/loader';

        if (!isKnownRoute(loc)) loc = '/';

        if (loc == '/') {
          if (startup.isFirstLaunch) return '/onboarding';
          if (startup.hasSubscription) return '/home';
          return '/paywall';
        }

        // Защита сценариев:

        // Онбординг доступен только при первом запуске
        if (loc == '/onboarding' && !startup.isFirstLaunch) {
          return startup.hasSubscription ? '/home' : '/paywall';
        }

        // Processing: в нашем сценарии он нужен только в цепочке покупки.
        // Если подписка уже активна — логичнее сразу на home/greetings.
        if (loc == '/processing' && startup.hasSubscription) {
          return '/home';
        }

        // Иначе — не редиректим.
        return null;
      },
      routes: [
        GoRoute(
          path: '/onboarding',
          builder: (context, state) => OnboardingPage(
            vm: MockOnboardingViewModel.demo(),
            onFinish: () {
              // Первый запуск завершён — дальше paywall
              startup.completeOnboarding();
              context.go('/paywall');
            },
          ),
        ),
        GoRoute(
          path: '/paywall',
          builder: (context, state) => PaywallPage(
            onContinue: () => context.go('/processing'),
            onClose: () => context.go('/onboarding'),
          ),
        ),
        GoRoute(
          path: '/processing',
          builder: (context, state) => ProcessPurchasePage(
            onPaid: () {
              startup.setSubscriptionActive(true);
              context.go('/home');
            },
          ),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => MainPage(vm: MockMainViewModel.demo()),
        ),
        GoRoute(path: '/loader', builder: (context, state) => LoadPage()),
      ],
    );
  }
}
