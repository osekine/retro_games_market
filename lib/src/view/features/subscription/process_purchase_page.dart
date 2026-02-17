import 'package:flutter/material.dart';
import 'package:retro_games_market/src/view/uikit/theme/app_colors.dart';
import 'package:retro_games_market/src/view/uikit/theme/app_theme_ext.dart';

class ProcessPurchasePage extends StatefulWidget {
  const ProcessPurchasePage({super.key, this.onPaid});

  /// Позже сюда можно повесить навигацию.
  final VoidCallback? onPaid;

  @override
  State<ProcessPurchasePage> createState() => _ProcessPurchasePageState();
}

class _ProcessPurchasePageState extends State<ProcessPurchasePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _dy;

  bool _paid = false;

  @override
  void initState() {
    super.initState();

    // 2 секунды общей "обработки"
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400), // период качания
    );

    _dy = Tween<double>(
      begin: -6,
      end: 6,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _startProcessing();
  }

  Future<void> _startProcessing() async {
    _controller.repeat(reverse: true);

    // "Пару секунд"
    await Future<void>.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    _controller.stop();
    setState(() => _paid = true);

    // Небольшая пауза, чтобы пользователь увидел успех (опционально)
    await Future<void>.delayed(const Duration(milliseconds: 600));
    if (!mounted) return;

    widget.onPaid?.call();
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              width: 280,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: t.border, width: 1),
                boxShadow: t.retroShadow2,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedBuilder(
                    animation: _dy,
                    builder: (context, child) {
                      final offsetY = _paid ? 0.0 : _dy.value;
                      return Transform.translate(
                        offset: Offset(0, offsetY),
                        child: child,
                      );
                    },
                    child: _DollarBadge(paid: _paid),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _paid ? 'Оплата прошла' : 'Обработка платежа…',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _paid
                        ? 'Спасибо! Доступ открыт.'
                        : 'Это займёт пару секунд.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Ретро progress line вместо обычного CircularProgressIndicator (в стиле)
                  if (!_paid)
                    Container(
                      height: 10,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceAlt,
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(color: t.border, width: 1),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(999),
                        child: _IndefiniteBar(controller: _controller),
                      ),
                    )
                  else
                    Container(
                      height: 10,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.success,
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(color: t.border, width: 1),
                        boxShadow: t.retroShadow1,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DollarBadge extends StatelessWidget {
  final bool paid;
  const _DollarBadge({required this.paid});

  @override
  Widget build(BuildContext context) {
    final t = context.appTheme;

    final bg = paid ? AppColors.success : AppColors.accent;
    final fg = AppColors.onAccent;

    return Container(
      width: 96,
      height: 96,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: t.border, width: 1),
        boxShadow: t.retroShadow2,
      ),
      child: Center(
        child: Text(
          paid ? '✓' : r'$',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            color: fg,
            fontWeight: FontWeight.w800,
            height: 1,
          ),
        ),
      ),
    );
  }
}

/// Простая "бегущая" полоска без реальной логики прогресса.
/// Завязана на том же controller, чтобы всё было синхронно.
class _IndefiniteBar extends StatelessWidget {
  final AnimationController controller;
  const _IndefiniteBar({required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        // controller.value: 0 → 1 (repeat)
        final v = controller.value;

        const segmentWidthFactor = 0.35; // ширина бегущего сегмента

        // Сдвиг от -segmentWidth до 1.0
        final left = -segmentWidthFactor + (1 + segmentWidthFactor) * v;

        return Stack(
          children: [
            Positioned.fill(child: Container(color: Colors.transparent)),
            Positioned(
              left: left * MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width * segmentWidthFactor,
              top: 0,
              bottom: 0,
              child: Container(color: AppColors.accent),
            ),
          ],
        );
      },
    );
  }
}
