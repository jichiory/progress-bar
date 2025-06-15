import 'package:flutter/material.dart';
import 'package:progress_bar_example/controllers/progress_bar.dart';
import 'package:progress_bar_example/painters/progress_painter.dart';
import 'package:progress_bar_example/painters/semi_circular_painter.dart';
import 'package:progress_bar_example/styles/circular_painter.dart';

class SemiCircularProgress extends StatelessWidget {
  final SemiCircularPainterStyle style;
  final ProgressBarController controller;
  final Widget label;
  const SemiCircularProgress({
    super.key,
    required this.controller,
    required this.style,
    this.label = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, _) {
        return SizedBox.fromSize(
          size: style.size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: style.size,
                painter: ProgressPainter(
                  paintingStrategy: SemiCircularPainter(),
                  progress: value,
                  style: style,
                ),
              ),
              label,
            ],
          ),
        );
      },
    );
  }
}
