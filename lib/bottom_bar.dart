library bottombar;

import 'package:flutter/material.dart';

import 'painter/wave_painter.dart';

class WaveBottomBar extends StatefulWidget {
  final double? height;
  final double? waveHeight;
  final Color? backgroundColor;
  final double? elevation;
  final Color? shadowColor;
  final List<BottomNavigationBarItem> items;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;
  final Function(int index) onTap;

  const WaveBottomBar({
    Key? key,
    this.height,
    this.waveHeight,
    this.backgroundColor,
    this.elevation,
    this.shadowColor,
    required this.items,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    required this.onTap,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WaveBottomBarState();
}

class _WaveBottomBarState extends State<WaveBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: Size(MediaQuery.of(context).size.width, widget.height ?? 0),
          painter: WavePainter(
            waveHeight: widget.waveHeight ?? 0,
            backgroundColor: widget.backgroundColor ?? Colors.white,
            elevation: widget.elevation ?? 0,
            shadowColor: widget.shadowColor ?? Colors.grey.shade200,
            length: widget.items.length,
          ),
        ),
      ],
    );
  }
}
