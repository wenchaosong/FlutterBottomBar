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

/// control the current index
class WaveBarController {
  /// the widget state [_WaveBottomBarState]
  /// can use this to control index
  _WaveBottomBarState? _state;

  /// auto bind, no need to call
  void _bindState(_WaveBottomBarState state) {
    _state = state;
  }

  /// need to call when the stateful page is disposed
  void dispose() {
    _state = null;
  }

  /// call this to change the current index
  void animateToIndex(int index) {
    _state!.animToIndex(index);
  }
}

/// A bottom widget that like a wave can smoothly move to the active position
/// and provide much attrs to config the widget
class WaveBottomBar extends StatefulWidget {
  /// width of the [WaveBottomBar]
  final double? width;

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

  /// this is used to update the current index
  final WaveBarController? controller;

  /// the margin between active label and icon
  final double selectedLabelMargin;

  /// the margin between normal label and icon
  final double unselectedLabelMargin;

  /// the margin between the active item and top of the wave
  final double activeTopMargin;

  /// corner radius of the [WaveBottomBar]
  final BorderRadius corner;

  /// the wave move anim duration
  final Duration duration;

  /// the wave move anim curve
  final Curve curve;

  /// active item text style
  final TextStyle selectedLabelStyle;

  /// normal item text style
  final TextStyle unselectedLabelStyle;

  /// whether the labels are shown for the selected [BottomNavigationBarItem].
  final bool showSelectedLabel;

  /// whether the labels are shown for the unselected [BottomNavigationBarItem]s.
  final bool showUnselectedLabel;

  /// whether remove padding of bottom
  final bool removeBottom;

  /// called when one of the [items] is tapped.
  final Function(int index) onTap;

  WaveBottomBar({
    Key? key,
    this.width,
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
    this.controller,
    this.selectedLabelMargin = 8,
    this.unselectedLabelMargin = 5,
    this.activeTopMargin = -25,
    this.corner = BorderRadius.zero,
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
    this.showSelectedLabel = true,
    this.showUnselectedLabel = true,
    this.removeBottom = false,
    required this.onTap,
  }) : super(key: key) {
    if (type == WaveBottomBarType.fixed) {
      assert(items.length % 2 != 0);
    }
  }

  @override
  State<StatefulWidget> createState() => _WaveBottomBarState();
}

class _WaveBottomBarState extends State<WaveBottomBar> with SingleTickerProviderStateMixin {
  /// the active item index
  int _currentIndex = 0;
  late AnimationController _animCon;

  @override
  void initState() {
    super.initState();

    widget.controller?._bindState(this);

    _animCon = AnimationController(vsync: this)
      ..addListener(() {
        setState(() {});
      });

    animToIndex(widget.initialIndex);
  }

  @override
  void didUpdateWidget(covariant WaveBottomBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != null && oldWidget.controller != widget.controller) {
      widget.controller?._bindState(this);
    }
  }

  @override
  void dispose() {
    _animCon.dispose();
    super.dispose();
  }

  /// the normal widget list of bottom items, contains icon and text
  Widget createNormalItem() {
    final childItem = <Widget>[];
    for (var i = 0; i < widget.items.length; i++) {
      if (_currentIndex == i ||
          (widget.type == WaveBottomBarType.fixed && i == widget.items.length ~/ 2)) {
        childItem.add(const Expanded(child: SizedBox()));
        continue;
      }
      childItem.add(Expanded(
        child: GestureDetector(
          onTap: () {
            widget.onTap(i);
            animToIndex(i);
          },
          child: Container(
            height: widget.height,
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.items[i].icon,
                if (widget.showUnselectedLabel) ...[
                  SizedBox(height: widget.unselectedLabelMargin),
                  Text(
                    "${widget.items[i].label}",
                    style: widget.unselectedLabelStyle,
                  ),
                ],
              ],
            ),
          ),
        ),
      ));
    }
    return Row(children: childItem);
  }

  /// the active and fixed item
  List<Widget> createFixedItem(double perWidth) {
    final childItem = <Widget>[];

    if (widget.type == WaveBottomBarType.fixed) {
      if (_currentIndex == widget.items.length ~/ 2) {
        childItem.add(buildItem(perWidth, _currentIndex));
      } else {
        childItem.add(buildItem(perWidth, _currentIndex, hasFixed: false));
        childItem.add(buildItem(perWidth, widget.items.length ~/ 2, isSelect: false));
      }
    } else {
      childItem.add(buildItem(perWidth, _currentIndex));
    }

    return childItem;
  }

  /// create the base item
  Widget buildItem(
    double perWidth,
    int index, {
    bool hasFixed = true,
    bool isSelect = true,
  }) {
    bool hideLabel = false;
    if (!widget.showSelectedLabel) {
      hideLabel = true;
    } else {
      if (widget.direction == WaveBottomBarDirection.down && hasFixed) {
        hideLabel = true;
      }
    }
    return Positioned(
      left: index * perWidth,
      top: hasFixed ? widget.activeTopMargin : 0,
      bottom: MediaQuery.of(context).padding.bottom,
      child: GestureDetector(
        onTap: () {
          widget.onTap(index);
          animToIndex(index);
        },
        child: SizedBox(
          width: perWidth,
          child: hasFixed && widget.fixedWidget != null
              ? Column(children: [widget.fixedWidget!])
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.items[index].activeIcon,
                    if (!hideLabel) ...[
                      SizedBox(
                        height:
                            hasFixed ? widget.selectedLabelMargin : widget.unselectedLabelMargin,
                      ),
                      Text(
                        "${widget.items[index].label}",
                        style: isSelect ? widget.selectedLabelStyle : widget.unselectedLabelStyle,
                      ),
                    ],
                  ],
                ),
        ),
      ),
    );
  }

  /// start anim to active item, pass the percentage to the wave
  void animToIndex(int index) {
    _currentIndex = index;
    setState(() {});
    if (widget.type == WaveBottomBarType.fixed) {
      final middle = (widget.items.length ~/ 2) / widget.items.length;
      _animCon.value = middle;
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
    final bottom = MediaQuery.of(context).padding.bottom;
    final width = widget.width ?? MediaQuery.of(context).size.width;
    final perWidth = width / widget.items.length;
    final height = widget.removeBottom ? widget.height : widget.height + bottom;
    return Stack(
      fit: StackFit.loose,
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          width: width,
          height: height,
          child: CustomPaint(
            painter: WavePainter(
              amplitude: widget.amplitude,
              waveLength: widget.waveLength,
              backgroundColor: widget.backgroundColor ?? Colors.white,
              elevation: widget.elevation ?? 0,
              shadowColor: widget.shadowColor ?? Colors.grey.shade300,
              direction: widget.direction,
              corner: widget.corner,
              barCount: widget.items.length,
              percentage: _animCon.value,
            ),
          ),
        ),
        createNormalItem(),
        ...createFixedItem(perWidth),
      ],
    );
  }
}
