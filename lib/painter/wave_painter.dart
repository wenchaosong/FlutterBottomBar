import 'package:flutter/material.dart';

import '../bottom_bar.dart';

class WavePainter extends CustomPainter {
  final _paint = Paint();
  final _shadowPaint = Paint();

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
  }

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    var perWidth = size.width / length;

    var begin = size.width * percentage;
    var middle = begin + perWidth / 2;

    path.lineTo(middle - waveLength / 2, 0);

    path.cubicTo(
      middle - waveLength / 4,
      0,
      middle - waveLength / 4,
      direction == WaveBottomBarDirection.up ? -amplitude : amplitude,
      middle,
      direction == WaveBottomBarDirection.up ? -amplitude : amplitude,
    );
    path.cubicTo(
      middle + waveLength / 4,
      direction == WaveBottomBarDirection.up ? -amplitude : amplitude,
      middle + waveLength / 4,
      0,
      middle + waveLength / 2,
      0,
    );

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawPath(path, _shadowPaint);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
