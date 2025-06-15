import 'package:flutter/material.dart';
import 'package:progress_bar_example/pens/pen.dart';

class GradientPen extends Pen {
  final Gradient gradient;
  final Rect bounds;
  GradientPen({
    required this.gradient,
    required this.bounds,
  }) : super(
          color: Colors.transparent,
        );

  @override
  Paint toPaint() {
    return super.toPaint()..shader = gradient.createShader(bounds);
  }
}
