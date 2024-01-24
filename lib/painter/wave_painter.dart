import 'package:flutter/material.dart';

import '../bottom_bar.dart';
import '../shape/wave_shape.dart';

class WavePainter extends CustomPainter {
  final _paint = Paint();
  final _shadowPaint = Paint();
  late WaveShape _shape;

  final double amplitude;
  final double waveLength;
  final Color backgroundColor;
  final double elevation;
  final Color shadowColor;
  final WaveBottomBarDirection direction;
  final int length;
  final double percentage;

  WavePainter({
    required this.amplitude,
    required this.waveLength,
    required this.backgroundColor,
    required this.elevation,
    required this.shadowColor,
    required this.direction,
    required this.length,
    required this.percentage,
  }) : super(repaint: const AlwaysStoppedAnimation(0)) {
    _paint.color = backgroundColor;
    _shadowPaint
      ..color = shadowColor
      ..maskFilter = MaskFilter.blur(BlurStyle.outer, elevation);
    _shape = WaveShape(
      amplitude: amplitude,
      waveLength: waveLength,
      direction: direction,
      length: length,
      percentage: percentage,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    var host = Rect.fromLTWH(0, 0, size.width, size.height);
    var path = _shape.getOuterPath(host, host);
    canvas.drawPath(path, _shadowPaint);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
