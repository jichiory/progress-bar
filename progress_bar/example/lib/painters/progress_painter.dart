import 'package:flutter/material.dart';
import 'package:progress_bar_example/painters/abstracts/progress_painter.dart';
import 'package:progress_bar_example/styles/circular_painter.dart';

class ProgressPainter extends CustomPainter {
  final SemiCircularPainterStyle style;
  final double progress;
  final IProgressPainter paintingStrategy;
  const ProgressPainter({
    required this.style,
    required this.progress,
    required this.paintingStrategy,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = style.backgroundPen.toPaint();

    paintingStrategy.backgroundPaint(backgroundPaint, canvas, size);

    final progressPaint = style.progressPen.toPaint();

    paintingStrategy.progressPaint(progressPaint, canvas, size, progress);
  }

  @override
  bool shouldRepaint(covariant ProgressPainter oldDelegate) {
    return progress != oldDelegate.progress || style == oldDelegate.style;
  }
}
