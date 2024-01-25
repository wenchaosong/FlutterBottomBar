import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bottom_bar/bottom_bar.dart';

import '../data/bar_data.dart';

class UsePage extends StatefulWidget {
  const UsePage({super.key});

  @override
  State<StatefulWidget> createState() => _UsePageState();
}

class _UsePageState extends State<UsePage> {
  Color getRandomColor() {
    return Color.fromARGB(
      60,
      Random().nextInt(256),
      Random().nextInt(256),
      Random().nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        title: Text('Use'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            WaveBottomBar(
              items: BarItem.simpleUse,
              onTap: (index) {
                debugPrint("$index");
              },
            ),
            SizedBox(height: 10),
            WaveBottomBar(
              items: BarItem.simpleUse,
              fixedWidget: ClipOval(
                child: Container(
                  width: 45,
                  height: 45,
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Icon(Icons.refresh, size: 35, color: Colors.white),
                ),
              ),
              onTap: (index) {
                debugPrint("$index");
              },
            ),
            SizedBox(height: 10),
            WaveBottomBar(
              items: BarItem.fixed,
              type: WaveBottomBarType.fixed,
              onTap: (index) {
                debugPrint("$index");
              },
            ),
            SizedBox(height: 10),
            WaveBottomBar(
              items: BarItem.fixed,
              fixedWidget: ClipOval(
                child: Container(
                  width: 45,
                  height: 45,
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Icon(Icons.add, size: 35, color: Colors.white),
                ),
              ),
              type: WaveBottomBarType.fixed,
              onTap: (index) {
                debugPrint("$index");
              },
            ),
            SizedBox(height: 10),
            WaveBottomBar(
              amplitude: 42,
              waveLength: 120,
              activeTopMargin: 34,
              items: BarItem.simpleUse,
              direction: WaveBottomBarDirection.down,
              showSelectedLabel: false,
              onTap: (index) {
                debugPrint("$index");
              },
            ),
            SizedBox(height: 10),
            WaveBottomBar(
              amplitude: 42,
              waveLength: 120,
              activeTopMargin: 34,
              items: BarItem.fixed,
              type: WaveBottomBarType.fixed,
              direction: WaveBottomBarDirection.down,
              onTap: (index) {
                debugPrint("$index");
              },
            ),
          ],
        ),
      ),
    );
  }
}
