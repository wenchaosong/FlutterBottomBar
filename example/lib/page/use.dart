import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wave_bottom_bar/bottom_bar.dart';

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
            SizedBox(height: 50),
            WaveBottomBar(
              items: BarItem.simpleUse,
              onTap: (index) {
                debugPrint("$index");
              },
            ),
            SizedBox(height: 40),
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
            SizedBox(height: 40),
            WaveBottomBar(
              items: BarItem.fixed,
              type: WaveBottomBarType.fixed,
              onTap: (index) {
                debugPrint("$index");
              },
            ),
            SizedBox(height: 40),
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
            SizedBox(height: 40),
            WaveBottomBar(
              amplitude: 42,
              waveLength: 120,
              activeTopMargin: -8,
              items: BarItem.simpleUse,
              direction: WaveBottomBarDirection.down,
              onTap: (index) {
                debugPrint("$index");
              },
            ),
            SizedBox(height: 40),
            WaveBottomBar(
              amplitude: 42,
              waveLength: 120,
              activeTopMargin: -8,
              items: BarItem.fixed,
              type: WaveBottomBarType.fixed,
              direction: WaveBottomBarDirection.down,
              onTap: (index) {
                debugPrint("$index");
              },
            ),
            SizedBox(height: 200),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
        child: WaveBottomBar(
          items: BarItem.simpleUse,
          corner: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(20),
          ),
          onTap: (index) {
            debugPrint("$index");
          },
        ),
      ),
    );
  }
}
