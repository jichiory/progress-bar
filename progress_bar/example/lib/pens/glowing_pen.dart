import 'dart:ui';

import 'package:progress_bar_example/pens/pen.dart';

class GlowingPen extends Pen {
  final double sigma;

  const GlowingPen({
    required super.color,
    this.sigma = 4.0,
    super.strokeCap,
    super.width,
  });

  @override
  Paint toPaint() {
    return super.toPaint()
      ..maskFilter = MaskFilter.blur(
        BlurStyle.normal,
        sigma,
      );
  }
}
