import 'package:flutter/material.dart';

abstract class IProgressPainter {
  void backgroundPaint(Paint paint, Canvas canvas, Size size);
  void progressPaint(Paint paint, Canvas canvas, Size size, double progress);
}
