import 'package:flutter/material.dart';
import 'package:retro_games_market/src/view/uikit/widgets/segmented_cirular_loader.dart';

class LoadPage extends StatelessWidget {
  const LoadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SegmentedCircularLoader(
          segments: 14,
          size: 84,
          duration: const Duration(seconds: 2),
          loop: true,
        ),
      ),
    );
  }
}
