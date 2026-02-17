import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:retro_games_market/src/view/uikit/theme/app_colors.dart';
import 'package:retro_games_market/src/view/uikit/theme/app_theme_ext.dart';

class SegmentedCircularLoader extends StatefulWidget {
  const SegmentedCircularLoader({
    super.key,
    this.segments = 12,
    this.size = 72,
    this.strokeWidth = 12,
    this.gapRadians = 0.10,
    this.duration = const Duration(seconds: 1),
    this.loop = true,
  }) : assert(segments > 1);

  final int segments;
  final double size;
  final double strokeWidth;
  final double gapRadians;
  final Duration duration;
  final bool loop;

  @override
  State<SegmentedCircularLoader> createState() =>
      _SegmentedCircularLoaderState();
}

class _SegmentedCircularLoaderState extends State<SegmentedCircularLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: widget.duration);

    if (widget.loop) {
      _c.repeat();
    } else {
      _c.forward();
    }
  }

  @override
  void didUpdateWidget(covariant SegmentedCircularLoader oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.duration != widget.duration) {
      _c.duration = widget.duration;
      if (widget.loop) {
        _c
          ..stop()
          ..repeat();
      } else {
        _c
          ..stop()
          ..forward(from: 0);
      }
    } else if (oldWidget.loop != widget.loop) {
      if (widget.loop) {
        _c
          ..stop()
          ..repeat();
      } else {
        _c
          ..stop()
          ..forward(from: 0);
      }
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.appTheme;

    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _c,
        builder: (context, _) {
          // 0..1 (if looping, resets to 0)
          final progress = _c.value;

          return CustomPaint(
            painter: _SegmentedCircularPainter(
              progress: progress,
              segments: widget.segments,
              strokeWidth: widget.strokeWidth,
              gapRadians: widget.gapRadians,
              colorFilled: AppColors.accent,
              colorEmpty: AppColors.surfaceAlt,
              borderColor: t.border,
            ),
          );
        },
      ),
    );
  }
}

class _SegmentedCircularPainter extends CustomPainter {
  _SegmentedCircularPainter({
    required this.progress,
    required this.segments,
    required this.strokeWidth,
    required this.gapRadians,
    required this.colorFilled,
    required this.colorEmpty,
    required this.borderColor,
  });

  final double progress; // 0..1
  final int segments;
  final double strokeWidth;
  final double gapRadians;

  final Color colorFilled;
  final Color colorEmpty;
  final Color borderColor;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = (math.min(size.width, size.height) - strokeWidth) / 2;

    final segSweep = (2 * math.pi) / segments;
    final usableSweep = math.max(0.0, segSweep - gapRadians);

    final filledSegments = (progress * segments).clamp(0, segments).floor();

    final filledPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = strokeWidth
      ..color = colorFilled;

    final emptyPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = strokeWidth
      ..color = colorEmpty;

    final rect = Rect.fromCircle(center: center, radius: radius);

    // Start at top (-90°)
    final startBase = -math.pi / 2;

    for (var i = 0; i < segments; i++) {
      final start = startBase + i * segSweep + gapRadians / 2;

      // Draw empty segment
      canvas.drawArc(rect, start, usableSweep, false, emptyPaint);

      // If segment is filled, draw filled segment over it
      if (i < filledSegments) {
        canvas.drawArc(rect, start, usableSweep, false, filledPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _SegmentedCircularPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.segments != segments ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.gapRadians != gapRadians ||
        oldDelegate.colorFilled != colorFilled ||
        oldDelegate.colorEmpty != colorEmpty ||
        oldDelegate.borderColor != borderColor;
  }
}
