import 'package:flutter/material.dart';

class Pen {
  final double width;
  final Color color;
  final StrokeCap strokeCap;
  const Pen({
    required this.color,
    this.width = 10.0,
    this.strokeCap = StrokeCap.round,
  });

  Paint toPaint() {
    return Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = width
      ..strokeCap = strokeCap;
  }
}
