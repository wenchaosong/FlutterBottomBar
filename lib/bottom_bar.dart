library bottombar;

import 'package:flutter/material.dart';

import 'painter/wave_painter.dart';

class WaveBottomBar extends StatefulWidget {
  final double? height;
  final double? amplitude;
  final double? waveLength;
  final Color? backgroundColor;
  final double? elevation;
  final Color? shadowColor;
  final int? initialIndex;
  final List<BottomNavigationBarItem> items;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;
  final Function(int index) onTap;

  const WaveBottomBar({
    Key? key,
    this.height,
    this.amplitude,
    this.waveLength,
    this.backgroundColor,
    this.elevation,
    this.shadowColor,
    this.initialIndex,
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
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _currentIndex = widget.initialIndex ?? 0;
    setState(() {});
  }

  List<Widget> createChild() {
    final List<Widget> child = [];
    for (var i = 0; i < widget.items.length; i++) {
      if (i == _currentIndex) {
        child.add(Expanded(
          child: InkWell(
            onTap: () {
              widget.onTap(i);
              if (_currentIndex == i) {
                return;
              }
              _currentIndex = i;
              setState(() {});
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.items[i].activeIcon,
                const SizedBox(height: 5),
                Text(
                  "${widget.items[i].label}",
                  style: widget.selectedLabelStyle,
                ),
              ],
            ),
          ),
        ));
        continue;
      }
      child.add(Expanded(
        child: InkWell(
          onTap: () {
            widget.onTap(i);
            if (_currentIndex == i) {
              return;
            }
            _currentIndex = i;
            setState(() {});
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.items[i].icon,
              const SizedBox(height: 5),
              Text(
                "${widget.items[i].label}",
                style: widget.unselectedLabelStyle,
              ),
            ],
          ),
        ),
      ));
    }
    return child;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 0,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, widget.height ?? 0),
            painter: WavePainter(
              amplitude: widget.amplitude ?? 0,
              waveLength: widget.waveLength ?? 0,
              backgroundColor: widget.backgroundColor ?? Colors.transparent,
              elevation: widget.elevation ?? 0,
              shadowColor: widget.shadowColor ?? Colors.grey.shade200,
              length: widget.items.length,
              currentIndex: _currentIndex,
            ),
          ),
          Row(children: createChild()),
        ],
      ),
    );
  }
}
