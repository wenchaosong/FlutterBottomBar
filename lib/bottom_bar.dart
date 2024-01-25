library bottombar;

import 'package:flutter/material.dart';

import 'painter/wave_painter.dart';

/// type of the [WaveBottomBar]
enum WaveBottomBarType {
  /// default type of the [WaveBottomBar], the wave can move
  normal,

  /// wave can't move, and it is always at middle
  fixed,
}

/// direction of the [WaveBottomBar]
enum WaveBottomBarDirection {
  /// default direction of the wave, the wave direction is up
  up,

  /// the wave direction is down, this required Scaffold extendBody is true
  down,
}

/// A bottom widget that like a wave can smoothly move to the active position
/// and provide much attrs to config the widget
class WaveBottomBar extends StatefulWidget {
  /// height of the [WaveBottomBar]
  final double height;

  /// amplitude or height of the [WavePainter]
  /// If the value is 0, the wave is gone
  final double amplitude;

  /// length of the [WavePainter]
  /// If the value is 0, the wave is gone
  final double waveLength;

  /// whole widget background color
  final Color? backgroundColor;

  /// shadow of the [WavePainter]
  final double? elevation;

  /// shadow color of the [WavePainter]
  final Color? shadowColor;

  /// the initial active index of the [WaveBottomBar]
  final int initialIndex;

  /// widget list of the [WaveBottomBar]
  /// contains normal icon, active icon and text
  final List<BottomNavigationBarItem> items;

  /// widget inside wave only can be configured when [type] is fixed
  final Widget? fixedWidget;

  /// type of the [WaveBottomBar]
  /// See [WaveBottomBarType] for more information
  final WaveBottomBarType type;

  /// direction of the [WaveBottomBar]
  /// See [WaveBottomBarDirection] for more information
  final WaveBottomBarDirection direction;

  /// the margin between label and icon
  final double labelMargin;

  /// the margin between the active item and top of the wave
  final double activeTopMargin;

  /// the wave move anim duration
  final Duration duration;

  /// the wave move anim curve
  final Curve curve;

  /// active item text style
  final TextStyle selectedLabelStyle;

  /// normal item text style
  final TextStyle unselectedLabelStyle;

  /// whether the labels are shown for the selected [BottomNavigationBarItem].
  final bool? showSelectedLabel;

  /// whether the labels are shown for the unselected [BottomNavigationBarItem]s.
  final bool? showUnselectedLabel;

  /// called when one of the [items] is tapped.
  final Function(int index) onTap;

  WaveBottomBar({
    Key? key,
    this.height = 56.0,
    this.amplitude = 25,
    this.waveLength = 100,
    this.backgroundColor,
    this.elevation,
    this.shadowColor,
    this.initialIndex = 0,
    required this.items,
    this.fixedWidget,
    this.type = WaveBottomBarType.normal,
    this.direction = WaveBottomBarDirection.up,
    this.labelMargin = 3,
    this.activeTopMargin = 5,
    this.duration = const Duration(milliseconds: 50),
    this.curve = Curves.linear,
    this.selectedLabelStyle = const TextStyle(
      fontSize: 12,
      color: Colors.blue,
    ),
    this.unselectedLabelStyle = const TextStyle(
      fontSize: 12,
      color: Colors.grey,
    ),
    this.showSelectedLabel,
    this.showUnselectedLabel,
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
  /// the active item index
  int _currentIndex = 0;
  late AnimationController _animCon;

  @override
  void initState() {
    super.initState();

    _animCon = AnimationController(vsync: this)
      ..addListener(() {
        setState(() {});
      });

    _currentIndex = widget.initialIndex;
    animToIndex();
    setState(() {});
  }

  @override
  void dispose() {
    _animCon.dispose();
    super.dispose();
  }

  /// the normal widget list of bottom items, contains icon and text
  List<Widget> createNormalItem() {
    final List<Widget> child = [];
    for (var i = 0; i < widget.items.length; i++) {
      if (_currentIndex == i) {
        child.add(Expanded(child: Container()));
        continue;
      }
      if (widget.type == WaveBottomBarType.fixed) {
        if (i == widget.items.length ~/ 2) {
          child.add(Expanded(
            child: Container(
              height: widget.height + widget.amplitude,
              margin: EdgeInsets.only(top: widget.activeTopMargin),
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  widget.onTap(i);
                  _currentIndex = i;
                  animToIndex();
                  setState(() {});
                },
                child: widget.fixedWidget == null
                    ? Column(
                        children: [
                          widget.items[i].icon,
                          //TODO how to set same margin with normal item
                          const SizedBox(height: 4.5),
                          if (widget.showUnselectedLabel ?? true)
                            SizedBox(height: widget.labelMargin),
                          if (widget.showUnselectedLabel ?? true)
                            Text(
                              "${widget.items[i].label}",
                              style: widget.unselectedLabelStyle,
                            ),
                        ],
                      )
                    : Column(children: [widget.fixedWidget!]),
              ),
            ),
          ));
        } else {
          child.add(Expanded(
            child: InkWell(
              onTap: () {
                widget.onTap(i);
                _currentIndex = i;
                animToIndex();
                setState(() {});
              },
              child: SizedBox(
                height: widget.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.items[i].icon,
                    if (widget.showUnselectedLabel ?? true)
                      SizedBox(height: widget.labelMargin),
                    if (widget.showUnselectedLabel ?? true)
                      Text(
                        "${widget.items[i].label}",
                        style: widget.unselectedLabelStyle,
                      ),
                  ],
                ),
              ),
            ),
          ));
        }
      } else {
        child.add(Expanded(
          child: InkWell(
            onTap: () {
              widget.onTap(i);
              _currentIndex = i;
              animToIndex();
              setState(() {});
            },
            child: SizedBox(
              height: widget.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.items[i].icon,
                  if (widget.showUnselectedLabel ?? true)
                    SizedBox(height: widget.labelMargin),
                  if (widget.showUnselectedLabel ?? true)
                    Text(
                      "${widget.items[i].label}",
                      style: widget.unselectedLabelStyle,
                    ),
                ],
              ),
            ),
          ),
        ));
      }
    }
    return child;
  }

  /// the active item
  Widget createActiveItem(double perWidth) {
    if (widget.type == WaveBottomBarType.fixed) {
      if (_currentIndex == widget.items.length ~/ 2) {
        return Positioned(
          left: perWidth * _currentIndex,
          top: widget.activeTopMargin,
          child: Container(
            width: perWidth,
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                widget.onTap(_currentIndex);
              },
              child: widget.fixedWidget == null
                  ? Column(
                      children: [
                        widget.items[_currentIndex].activeIcon,
                        //TODO how to set same margin with normal item
                        const SizedBox(height: 4.5),
                        if (widget.showSelectedLabel ?? true)
                          SizedBox(height: widget.labelMargin),
                        if (widget.showSelectedLabel ?? true)
                          Text(
                            "${widget.items[_currentIndex].label}",
                            style: widget.selectedLabelStyle,
                          ),
                      ],
                    )
                  : Column(children: [widget.fixedWidget!]),
            ),
          ),
        );
      } else {
        return Positioned(
          left: perWidth * _currentIndex,
          bottom: 0,
          child: SizedBox(
            width: perWidth,
            height: widget.height,
            child: InkWell(
              onTap: () {
                widget.onTap(_currentIndex);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.items[_currentIndex].activeIcon,
                  if (widget.showSelectedLabel ?? true)
                    SizedBox(height: widget.labelMargin),
                  if (widget.showSelectedLabel ?? true)
                    Text(
                      "${widget.items[_currentIndex].label}",
                      style: widget.selectedLabelStyle,
                    ),
                ],
              ),
            ),
          ),
        );
      }
    } else {
      return Positioned(
        left: perWidth * _currentIndex,
        top: widget.activeTopMargin,
        child: Container(
          width: perWidth,
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {
              widget.onTap(_currentIndex);
            },
            child: widget.fixedWidget == null
                ? Column(
                    children: [
                      widget.items[_currentIndex].activeIcon,
                      //TODO how to set same margin with normal item
                      const SizedBox(height: 4.5),
                      if (widget.showSelectedLabel ?? true)
                        SizedBox(height: widget.labelMargin),
                      if (widget.showSelectedLabel ?? true)
                        Text(
                          "${widget.items[_currentIndex].label}",
                          style: widget.selectedLabelStyle,
                        ),
                    ],
                  )
                : Column(children: [widget.fixedWidget!]),
          ),
        ),
      );
    }
  }

  /// start anim to active item, pass the percentage to the wave
  void animToIndex() {
    if (widget.type == WaveBottomBarType.fixed) {
      _animCon.animateTo(
        (widget.items.length ~/ 2) / widget.items.length,
        duration: const Duration(milliseconds: 10),
      );
      return;
    }
    _animCon.animateTo(
      _currentIndex / widget.items.length,
      duration: widget.duration,
      curve: widget.curve,
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var perWidth = width / widget.items.length;
    return SizedBox(
      height: widget.height + widget.amplitude,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: width,
            height: widget.height,
            child: CustomPaint(
              painter: WavePainter(
                amplitude: widget.amplitude,
                waveLength: widget.waveLength,
                backgroundColor: widget.backgroundColor ?? Colors.white,
                elevation: widget.elevation ?? 0,
                shadowColor: widget.shadowColor ?? Colors.grey.shade300,
                direction: widget.direction,
                barCount: widget.items.length,
                percentage: _animCon.value,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: createNormalItem(),
          ),
          createActiveItem(perWidth),
        ],
      ),
    );
  }
}
