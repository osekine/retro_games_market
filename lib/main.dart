import 'package:flutter/material.dart';
import 'package:retro_games_market/src/view/features/subscription/process_purchase_page.dart';
import 'package:retro_games_market/src/view/uikit/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light(),
      // routes: {'/main': (_) => const MainRoute()},
      home: ProcessPurchasePage(),
    );
  }
}

// class MainRoute extends StatelessWidget {
//   const MainRoute({super.key});

//   static const routeName = '/main';

//   @override
//   Widget build(BuildContext context) {
//     // final args = ModalRoute.of(context)!.settings.arguments as String;

//     return MainPage(vm: getIt);
//   }
// }
