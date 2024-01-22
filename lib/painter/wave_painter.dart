import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  final _paint = Paint();
  final _shadowPaint = Paint();

  final double amplitude;
  final double waveLength;
  final Color backgroundColor;
  final double elevation;
  final Color shadowColor;
  final int length;
  final int currentIndex;

  WavePainter({
    required this.amplitude,
    required this.waveLength,
    required this.backgroundColor,
    required this.elevation,
    required this.shadowColor,
    required this.length,
    required this.currentIndex,
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
    var begin = size.width * 0.50 - perWidth / 2;
    var end = size.width * 0.50 + perWidth / 2;

    path.lineTo(begin, 0);

    path.cubicTo(
      begin + waveLength,
      0,
      size.width * 0.50 - waveLength,
      -amplitude,
      size.width * 0.50,
      -amplitude,
    );
    path.cubicTo(
      size.width * 0.50 + waveLength,
      -amplitude,
      end - waveLength,
      0,
      end,
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
