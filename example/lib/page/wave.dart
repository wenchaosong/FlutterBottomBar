import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:wave_bottom_bar/bottom_bar.dart';

import '../data/bar_data.dart';
import '../data/radio_data.dart';
import '../view/item_color.dart';
import '../view/item_radio.dart';
import '../view/item_select.dart';
import '../view/item_slide.dart';

class WavePage extends StatefulWidget {
  const WavePage({super.key});

  @override
  State<StatefulWidget> createState() => _WavePageState();
}

class _WavePageState extends State<WavePage> {
  final List<Curve> _curveList = [
    Curves.linear,
    Curves.decelerate,
    Curves.easeIn,
    Curves.easeOut,
    Curves.fastOutSlowIn,
    Curves.slowMiddle,
    Curves.bounceIn,
    Curves.bounceOut,
    Curves.bounceInOut,
    Curves.elasticIn,
    Curves.elasticOut,
  ];

  double _height = 56.0;
  double _amplitude = 25.0;
  double _waveLength = 100.0;
  Color _backgroundColor = Colors.white;
  double _elevation = 15.0;
  Color _shadowColor = Colors.grey.shade300;
  String _showFixedWidget = "false";
  String _direction = "up";
  double _selectLabelMargin = 8;
  double _unselectLabelMargin = 4.0;
  double _topMargin = 20.0;
  int _duration = 50;
  Curve _curve = Curves.linear;
  String _showSelectedLabel = "true";
  String _showUnselectedLabel = "true";

  void displayDialog(
    String title,
    Color color,
    Function(Color color) onColorChanged,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext con) {
        return AlertDialog(
          title: Text('Select $title color'),
          content: SingleChildScrollView(
            child: MaterialPicker(
              pickerColor: color,
              onColorChanged: (val) {
                onColorChanged(val);
                Navigator.of(con).pop();
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('Wave Bar'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ItemSlideWidget(
              title: 'Height',
              value: _height,
              min: 50.0,
              max: 100.0,
              divisions: 50,
              onChanged: (val) {
                _height = val;
                setState(() {});
              },
            ),
            ItemSlideWidget(
              title: 'Amplitude',
              value: _amplitude,
              min: 0.0,
              max: 50.0,
              divisions: 50,
              onChanged: (val) {
                _amplitude = val;
                setState(() {});
              },
            ),
            ItemSlideWidget(
              title: 'WaveLength',
              value: _waveLength,
              min: 0.0,
              max: 150.0,
              divisions: 50,
              onChanged: (val) {
                _waveLength = val;
                setState(() {});
              },
            ),
            ItemColorWidget(
              title: 'BackgroundColor',
              color: _backgroundColor,
              onTap: () {
                displayDialog(
                  "backgroundColor",
                  _backgroundColor,
                  (color) {
                    _backgroundColor = color;
                    setState(() {});
                  },
                );
              },
            ),
            ItemSlideWidget(
              title: 'Elevation',
              value: _elevation,
              min: 0.0,
              max: 50.0,
              divisions: 50,
              onChanged: (val) {
                _elevation = val;
                setState(() {});
              },
            ),
            ItemColorWidget(
              title: 'ShadowColor',
              color: _shadowColor,
              onTap: () {
                displayDialog(
                  "shadowColor",
                  _shadowColor,
                  (color) {
                    _shadowColor = color;
                    setState(() {});
                  },
                );
              },
            ),
            ItemRadioWidget(
              title: 'ShowFixedWidget',
              items: [
                RadioData(
                  title: "true",
                  value: "true",
                  groupValue: _showFixedWidget,
                  onChanged: (value) {
                    _showFixedWidget = value;
                    setState(() {});
                  },
                ),
                RadioData(
                  title: "false",
                  value: "false",
                  groupValue: _showFixedWidget,
                  onChanged: (value) {
                    _showFixedWidget = value;
                    setState(() {});
                  },
                ),
              ],
            ),
            ItemRadioWidget(
              title: 'Direction',
              items: [
                RadioData(
                  title: "up",
                  value: "up",
                  groupValue: _direction,
                  onChanged: (value) {
                    _direction = value;
                    setState(() {});
                  },
                ),
                RadioData(
                  title: "down",
                  value: "down",
                  groupValue: _direction,
                  onChanged: (value) {
                    _direction = value;
                    setState(() {});
                  },
                ),
              ],
            ),
            ItemSlideWidget(
              title: 'SelectLabelMargin',
              value: _selectLabelMargin,
              min: 0.0,
              max: 20.0,
              divisions: 20,
              onChanged: (val) {
                _selectLabelMargin = val;
                setState(() {});
              },
            ),
            ItemSlideWidget(
              title: 'UnselectLabelMargin',
              value: _unselectLabelMargin,
              min: 0.0,
              max: 20.0,
              divisions: 20,
              onChanged: (val) {
                _unselectLabelMargin = val;
                setState(() {});
              },
            ),
            ItemSlideWidget(
              title: 'TopMargin',
              value: _topMargin,
              min: 0.0,
              max: 50.0,
              divisions: 50,
              onChanged: (val) {
                _topMargin = val;
                setState(() {});
              },
            ),
            ItemSlideWidget(
              title: 'Duration',
              value: _duration.toDouble(),
              min: 10.0,
              max: 960.0,
              divisions: 50,
              onChanged: (val) {
                _duration = val.toInt();
                setState(() {});
              },
            ),
            ItemSelectWidget(
              title: "Curve",
              initCurve: _curve,
              curveList: _curveList,
              onSelect: (val) {
                _curve = val!;
                setState(() {});
              },
            ),
            ItemRadioWidget(
              title: 'ShowSelectLabel',
              items: [
                RadioData(
                  title: "true",
                  value: "true",
                  groupValue: _showSelectedLabel,
                  onChanged: (value) {
                    _showSelectedLabel = value;
                    setState(() {});
                  },
                ),
                RadioData(
                  title: "false",
                  value: "false",
                  groupValue: _showSelectedLabel,
                  onChanged: (value) {
                    _showSelectedLabel = value;
                    setState(() {});
                  },
                ),
              ],
            ),
            ItemRadioWidget(
              title: 'ShowUnselectLabel',
              items: [
                RadioData(
                  title: "true",
                  value: "true",
                  groupValue: _showUnselectedLabel,
                  onChanged: (value) {
                    _showUnselectedLabel = value;
                    setState(() {});
                  },
                ),
                RadioData(
                  title: "false",
                  value: "false",
                  groupValue: _showUnselectedLabel,
                  onChanged: (value) {
                    _showUnselectedLabel = value;
                    setState(() {});
                  },
                ),
              ],
            ),
            SizedBox(height: 200),
          ],
        ),
      ),
      bottomNavigationBar: WaveBottomBar(
        height: _height,
        amplitude: _amplitude,
        waveLength: _waveLength,
        backgroundColor: _backgroundColor,
        elevation: _elevation,
        shadowColor: _shadowColor,
        items: BarItem.simpleUse,
        fixedWidget: _showFixedWidget == "true"
            ? Container(
                width: 50,
                height: 50,
                color: Colors.red,
              )
            : null,
        direction: _direction == "up" ? WaveBottomBarDirection.up : WaveBottomBarDirection.down,
        selectedLabelMargin: _selectLabelMargin,
        unselectedLabelMargin: _unselectLabelMargin,
        activeTopMargin: -_topMargin,
        duration: Duration(milliseconds: _duration),
        curve: _curve,
        selectedLabelStyle: TextStyle(fontSize: 12, color: Colors.blue),
        unselectedLabelStyle: TextStyle(fontSize: 12, color: Colors.grey),
        showSelectedLabel: _showSelectedLabel == "true" ? true : false,
        showUnselectedLabel: _showUnselectedLabel == "true" ? true : false,
        onTap: (index) {
          debugPrint("$index");
        },
      ),
    );
  }
}
