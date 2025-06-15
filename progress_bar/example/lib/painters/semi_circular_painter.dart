import 'dart:ui';
import 'dart:math' as math;
import 'package:progress_bar_example/painters/abstracts/progress_painter.dart';

class SemiCircularPainter implements IProgressPainter {
  final double _startAngle;
  final double _sweepAngle;
  const SemiCircularPainter()
      : _startAngle = math.pi,
        _sweepAngle = math.pi;

  Rect _getArcRect(Size size) =>
      Rect.fromLTWH(0, 0, size.width, size.height * 2);

  @override
  void backgroundPaint(Paint paint, Canvas canvas, Size size) {
    final rect = _getArcRect(size);
    canvas.drawArc(
      rect,
      _startAngle,
      _sweepAngle,
      false,
      paint,
    );
  }

  @override
  void progressPaint(Paint paint, Canvas canvas, Size size, double progress) {
    final rect = _getArcRect(size);
    canvas.drawArc(
      rect,
      _startAngle,
      _sweepAngle * progress,
      false,
      paint,
    );
  }
}
