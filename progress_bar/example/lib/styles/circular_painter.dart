import 'package:flutter/material.dart';
import 'package:progress_bar_example/pens/pen.dart';

class ProgressPainterStyle {
  final Size size;
  final Pen backgroundPen;
  final Pen progressPen;
  const ProgressPainterStyle({
    required this.backgroundPen,
    required this.progressPen,
    required this.size,
  });

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ProgressPainterStyle &&
            (progressPen.color == other.progressPen.color ||
                progressPen.width == other.progressPen.width ||
                progressPen.strokeCap == other.progressPen.strokeCap ||
                other.backgroundPen.color == backgroundPen.color ||
                other.backgroundPen.strokeCap == backgroundPen.strokeCap ||
                other.backgroundPen.width == backgroundPen.width);
  }

  @override
  int get hashCode => Object.hashAll([size, backgroundPen, progressPen]);
}

class SemiCircularPainterStyle extends ProgressPainterStyle {
  SemiCircularPainterStyle({
    required double size,
    required super.backgroundPen,
    required super.progressPen,
  }) : super(size: Size(size, size / 2));
}
