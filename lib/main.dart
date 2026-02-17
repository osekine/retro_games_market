import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:retro_games_market/src/navigation/app_router.dart';
import 'package:retro_games_market/src/navigation/app_startup_state.dart';
import 'package:retro_games_market/src/service/local_data_service.dart';
import 'package:retro_games_market/src/view/uikit/theme/app_theme.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppStartupState _startup;
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();

    final dataService = LocalDataService();
    _startup = AppStartupState(dataService);

    _router = AppRouter.create(_startup);

    _startup.load();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _startup,
      builder: (context, _) {
        return MaterialApp.router(
          theme: AppTheme.light(),
          routerConfig: _router,
        );
      },
    );
  }
}
