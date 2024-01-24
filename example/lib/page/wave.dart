import 'package:flutter/material.dart';
import 'package:flutter_bottom_bar/bottom_bar.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../data/bar_data.dart';
import '../data/radio_data.dart';
import '../view/item_color.dart';
import '../view/item_radio.dart';
import '../view/item_slide.dart';

class WavePage extends StatefulWidget {
  const WavePage({super.key});

  @override
  State<StatefulWidget> createState() => _WavePageState();
}

class _WavePageState extends State<WavePage> {
  double _height = 60.0;
  double _amplitude = 35.0;
  double _waveLength = 100.0;
  Color _backgroundColor = Colors.white;
  double _elevation = 15.0;
  Color _shadowColor = Colors.red;
  String _direction = "up";

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
            child: BlockPicker(
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
      extendBody: true,
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
            Container(
              height: 1000,
              color: Colors.grey.shade500,
            ),
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
        direction: _direction == "up"
            ? WaveBottomBarDirection.up
            : WaveBottomBarDirection.down,
        items: BarItem.normalItems,
        selectedLabelStyle: TextStyle(fontSize: 12, color: Colors.blue),
        unselectedLabelStyle: TextStyle(fontSize: 12, color: Colors.grey),
        onTap: (index) {
          debugPrint("$index");
        },
      ),
    );
  }
}
