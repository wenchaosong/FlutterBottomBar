library bottombar;

import 'package:flutter/material.dart';

import 'painter/wave_painter.dart';

enum WaveBottomBarType { normal, fixed }

class WaveBottomBar extends StatefulWidget {
  final double? height;
  final double? amplitude;
  final double? waveLength;
  final Color? backgroundColor;
  final double? elevation;
  final Color? shadowColor;
  final int? initialIndex;
  final List<BottomNavigationBarItem> items;
  final WaveBottomBarType type;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;
  final Function(int index) onTap;

  WaveBottomBar({
    Key? key,
    this.height,
    this.amplitude,
    this.waveLength,
    this.backgroundColor,
    this.elevation,
    this.shadowColor,
    this.initialIndex,
    required this.items,
    this.type = WaveBottomBarType.normal,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    required this.onTap,
  }) : super(key: key) {
    if (type == WaveBottomBarType.fixed) {
      assert(items.length % 2 != 0);
    }
  }

  @override
  State<StatefulWidget> createState() => _WaveBottomBarState();
}

class _WaveBottomBarState extends State<WaveBottomBar>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _animCon;

  @override
  void initState() {
    super.initState();

    _animCon = AnimationController(vsync: this)
      ..addListener(() {
        setState(() {});
      });

    _currentIndex = widget.initialIndex ?? 0;
    animToIndex();
    setState(() {});
  }

  @override
  void dispose() {
    _animCon.dispose();
    super.dispose();
  }

  List<Widget> createChild() {
    final List<Widget> child = [];
    for (var i = 0; i < widget.items.length; i++) {
      child.add(Expanded(
        child: InkWell(
          onTap: () {
            widget.onTap(i);
            if (_currentIndex == i) {
              return;
            }
            _currentIndex = i;
            animToIndex();
            setState(() {});
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _currentIndex == i
                  ? widget.items[i].activeIcon
                  : widget.items[i].icon,
              //TODO set margin
              const SizedBox(height: 5),
              Text(
                "${widget.items[i].label}",
                style: widget.selectedLabelStyle,
              ),
            ],
          ),
        ),
      ));
    }
    return child;
  }

  void animToIndex() {
    if (widget.type == WaveBottomBarType.fixed) {
      _animCon.animateTo(0.5);
      return;
    }
    _animCon.animateTo(
      _currentIndex / widget.items.length,
      //TODO set anim
      duration: const Duration(milliseconds: 100),
    );
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
              percentage: _animCon.value,
            ),
          ),
          Row(children: createChild()),
        ],
      ),
    );
  }
}
