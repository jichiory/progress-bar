import 'package:flutter/material.dart';
import 'dart:math' as math;

class SemiCircularProgress extends StatelessWidget {
  const SemiCircularProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(200, 200),
      painter: SemiCircularPainter(
        progressColor: Colors.red,
        strokeWidth: 4,
        backgroundColor: Colors.red.withValues(alpha: 0.2),
        progress: 0.4,
      ),
    );
  }
}

class SemiCircularPainter extends CustomPainter {
  final Color progressColor;
  final Color backgroundColor;
  final double strokeWidth;
  final double progress;
  const SemiCircularPainter({
    required this.progressColor,
    required this.strokeWidth,
    required this.backgroundColor,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final radius = size.width / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final startAngle = math.pi;
    final sweepAngle = math.pi;

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, startAngle, sweepAngle, false, backgroundPaint);

    final progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
        rect, startAngle, sweepAngle * progress, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant SemiCircularPainter oldDelegate) {
    return progress != oldDelegate.progress ||
        backgroundColor != oldDelegate.backgroundColor ||
        progressColor != oldDelegate.progressColor ||
        strokeWidth != oldDelegate.strokeWidth;
  }
}
