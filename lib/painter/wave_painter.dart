import 'package:flutter/material.dart';

import '../bottom_bar.dart';

/// The shape of [WaveBottomBar], like a wave
class WavePainter extends CustomPainter {
  /// amplitude or height of the wave. If the value is 0, the wave is gone
  final double amplitude;

  /// length of the wave. If the value is 0, the wave is gone
  final double waveLength;

  /// whole widget background color
  final Color backgroundColor;

  /// shadow of the wave
  final double elevation;

  /// shadow color of the wave
  final Color shadowColor;

  /// direction of the [WaveBottomBar]
  /// See [WaveBottomBarDirection] for more information
  final WaveBottomBarDirection direction;

  /// corner radius of the [WaveBottomBar]
  final BorderRadius corner;

  /// length of bar item
  final int barCount;

  /// percentage of active item
  final double percentage;

  WavePainter({
    required this.amplitude,
    required this.waveLength,
    required this.backgroundColor,
    required this.elevation,
    required this.shadowColor,
    required this.direction,
    required this.corner,
    required this.barCount,
    required this.percentage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint pathPaint = Paint()..color = backgroundColor;
    final Paint shadowPaint = Paint()
      ..color = shadowColor
      ..maskFilter = MaskFilter.blur(BlurStyle.outer, elevation);

    final Path path = Path();

    path.moveTo(0, corner.topLeft.y);
    path.arcToPoint(
      Offset(corner.topLeft.x, 0),
      radius: corner.topLeft,
    );

    // each item width
    final perWidth = size.width / barCount;

    // calculate the active item begin position and middle position
    final begin = size.width * percentage;
    final middle = begin + perWidth / 2;

    // actual begin position is
    // active item middle position - half the wave length
    path.lineTo(middle - waveLength / 2, 0);

    // the left wave
    path.cubicTo(
      middle - waveLength / 4,
      0,
      middle - waveLength / 4,
      direction == WaveBottomBarDirection.up ? -amplitude : amplitude,
      middle,
      direction == WaveBottomBarDirection.up ? -amplitude : amplitude,
    );

    // the right wave, the end position is
    // active item middle position + half the wave length
    path.cubicTo(
      middle + waveLength / 4,
      direction == WaveBottomBarDirection.up ? -amplitude : amplitude,
      middle + waveLength / 4,
      0,
      middle + waveLength / 2,
      0,
    );

    path.lineTo(size.width - corner.topRight.x, 0);
    path.arcToPoint(
      Offset(size.width, corner.topRight.y),
      radius: corner.topRight,
    );

    path.lineTo(size.width, size.height - corner.bottomRight.y);
    path.arcToPoint(
      Offset(size.width - corner.bottomRight.x, size.height),
      radius: corner.bottomRight,
    );

    path.lineTo(corner.bottomLeft.x, size.height);
    path.arcToPoint(
      Offset(0, size.height - corner.bottomLeft.y),
      radius: corner.bottomLeft,
    );

    path.close();

    canvas.drawPath(path, pathPaint);
    if (elevation != 0) {
      // because elevation is 0 will only draw shadow
      canvas.drawPath(path, shadowPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
