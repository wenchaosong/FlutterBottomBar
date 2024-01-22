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
  final double percentage;

  WavePainter({
    required this.amplitude,
    required this.waveLength,
    required this.backgroundColor,
    required this.elevation,
    required this.shadowColor,
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
    var end = begin + perWidth;

    path.lineTo(begin, 0);

    //TODO calculate width
    path.cubicTo(
      begin + waveLength,
      0,
      middle - waveLength,
      -amplitude,
      middle,
      -amplitude,
    );
    path.cubicTo(
      middle + waveLength,
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
