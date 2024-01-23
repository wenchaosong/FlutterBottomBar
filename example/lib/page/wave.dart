import 'package:flutter/material.dart';
import 'package:flutter_bottom_bar/bottom_bar.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../view/item_bar.dart';
import '../view/item_text.dart';

class WavePage extends StatefulWidget {
  const WavePage({super.key});

  @override
  State<StatefulWidget> createState() => _WavePageState();
}

class _WavePageState extends State<WavePage> {
  double _height = 60.0;
  double _amplitude = 30.0;
  double _waveLength = 100.0;
  Color _backgroundColor = Colors.white;
  double _elevation = 15.0;
  String _direction = "up";

  Widget _buildHeight() {
    return Row(
      children: [
        Expanded(
          child: Slider(
            value: _height,
            min: 50.0,
            max: 100.0,
            divisions: 50,
            onChanged: (value) {
              _height = value.roundToDouble();
              setState(() {});
            },
          ),
        ),
        Text("${_height}")
      ],
    );
  }

  Widget _buildAmplitude() {
    return Row(
      children: [
        Expanded(
          child: Slider(
            value: _amplitude,
            min: 0.0,
            max: 50.0,
            divisions: 50,
            onChanged: (value) {
              _amplitude = value.roundToDouble();
              setState(() {});
            },
          ),
        ),
        Text("${_amplitude}")
      ],
    );
  }

  Widget _buildWaveLength() {
    return Row(
      children: [
        Expanded(
          child: Slider(
            value: _waveLength,
            min: 0.0,
            max: 150.0,
            divisions: 50,
            onChanged: (value) {
              _waveLength = value.roundToDouble();
              setState(() {});
            },
          ),
        ),
        Text("${_waveLength}")
      ],
    );
  }

  Widget _buildColor() {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Select color'),
              content: SingleChildScrollView(
                child: BlockPicker(
                  pickerColor: _backgroundColor,
                  onColorChanged: (color) {
                    _backgroundColor = color;
                    setState(() {});
                  },
                ),
              ),
            );
          },
        );
      },
      child: Container(
        color: _backgroundColor,
        margin: EdgeInsets.only(left: 20, right: 20),
      ),
    );
  }

  Widget _buildElevation() {
    return Row(
      children: [
        Expanded(
          child: Slider(
            value: _elevation,
            min: 0.0,
            max: 50.0,
            divisions: 50,
            onChanged: (value) {
              _elevation = value.roundToDouble();
              setState(() {});
            },
          ),
        ),
        Text("${_elevation}")
      ],
    );
  }

  Widget _buildDirection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Container()),
        Radio(
            value: "up",
            groupValue: _direction,
            onChanged: (value) {
              _direction = value!;
              setState(() {});
            }),
        Text("up"),
        Expanded(child: Container()),
        Radio(
            value: "down",
            groupValue: _direction,
            onChanged: (value) {
              _direction = value!;
              setState(() {});
            }),
        Text("down"),
        Expanded(child: Container()),
      ],
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
            ItemTextWidget(
              title: 'Height',
              subWidget: _buildHeight(),
            ),
            ItemTextWidget(
              title: 'Amplitude',
              subWidget: _buildAmplitude(),
            ),
            ItemTextWidget(
              title: 'WaveLength',
              subWidget: _buildWaveLength(),
            ),
            ItemTextWidget(
              title: 'BackgroundColor',
              subWidget: _buildColor(),
            ),
            ItemTextWidget(
              title: 'Elevation',
              subWidget: _buildElevation(),
            ),
            ItemTextWidget(
              title: 'Direction',
              subWidget: _buildDirection(),
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
        direction: _direction == "up"
            ? WaveBottomBarDirection.up
            : WaveBottomBarDirection.down,
        items: BarItem.items,
        selectedLabelStyle: TextStyle(fontSize: 12, color: Colors.blue),
        unselectedLabelStyle: TextStyle(fontSize: 12, color: Colors.grey),
        onTap: (index) {
          debugPrint("$index");
        },
      ),
    );
  }
}
