import 'package:flutter/material.dart';

import '../bottom_bar.dart';

class WaveShape extends NotchedShape {
  final double amplitude;
  final double waveLength;
  final WaveBottomBarDirection direction;
  final int length;
  final double percentage;

  WaveShape({
    required this.amplitude,
    required this.waveLength,
    required this.direction,
    required this.length,
    required this.percentage,
  });

  @override
  Path getOuterPath(Rect host, Rect? guest) {
    Path path = Path();

    var perWidth = host.right / length;

    var begin = host.right * percentage;
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

    path.lineTo(host.right, 0);
    path.lineTo(host.right, host.bottom);
    path.lineTo(0, host.bottom);
    path.close();
    return path;
  }
}
