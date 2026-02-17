import 'package:flutter/material.dart';
import 'package:retro_games_market/src/view_model/view_model.dart';
import 'package:retro_games_market/src/view/uikit/theme/theme.dart';

import 'onboarding_illustration_card.dart';
import 'page_dots_indicator.dart';

class OnboardingPage extends StatefulWidget {
  final IOnboardingViewModel vm;
  const OnboardingPage({super.key, required this.onFinish, required this.vm});

  final VoidCallback onFinish;

  @override
  State<OnboardingPage> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingPage> {
  final _controller = PageController();
  late final _pages = widget.vm.pages;
  int _index = 0;

  void _goNext() {
    if (_index >= _pages.length - 1) {
      widget.onFinish();
      return;
    }
    _controller.nextPage(
      duration: const Duration(milliseconds: 240),
      curve: Curves.easeOut,
    );
  }

  void _goBack() {
    _controller.previousPage(
      duration: const Duration(milliseconds: 240),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.appTheme;

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: Row(
                children: [
                  SizedBox(
                    width: 48,
                    child: _index == 0
                        ? const SizedBox.shrink()
                        : IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(
                              Icons.chevron_left,
                              color: AppColors.border,
                            ),
                            onPressed: _goBack,
                            tooltip: 'Back',
                          ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    // Illustration card (H=240dp)
                    SizedBox(
                      height: 240,
                      width: double.infinity,
                      child: PageView.builder(
                        controller: _controller,
                        itemCount: _pages.length,
                        onPageChanged: (v) => setState(() => _index = v),
                        itemBuilder: (context, i) {
                          return const OnboardingIllustrationCard();
                        },
                      ),
                    ),

                    const SizedBox(height: 48),

                    // Title + body driven by index (keeps structure stable)
                    Text(
                      _pages[_index].title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),

                    const SizedBox(height: 8),

                    Text(
                      _pages[_index].body,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textPrimary,
                        height: 1.25,
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Page indicator (H=16dp)
                    SizedBox(
                      height: 16,
                      child: PageDotsIndicator(
                        count: _pages.length,
                        index: _index,
                      ),
                    ),

                    // flex space
                    const Spacer(),

                    // Continue (H=48dp) + bottom inset 16dp
                    SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _goNext,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.surface,
                          foregroundColor: AppColors.accent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: t.border, width: 2),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Continue',
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                                color: AppColors.onAccent,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
