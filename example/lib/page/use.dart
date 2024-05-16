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
              removeBottom: true,
              onTap: (index) {
                debugPrint("$index");
              },
            ),
            SizedBox(height: 40),
            WaveBottomBar(
              items: BarItem.simpleUse,
              removeBottom: true,
              activeTopMargin: -20,
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
              removeBottom: true,
              type: WaveBottomBarType.fixed,
              onTap: (index) {
                debugPrint("$index");
              },
            ),
            SizedBox(height: 40),
            WaveBottomBar(
              items: BarItem.fixed,
              removeBottom: true,
              activeTopMargin: -20,
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
              activeTopMargin: -25,
              items: BarItem.simpleUse,
              removeBottom: true,
              direction: WaveBottomBarDirection.down,
              onTap: (index) {
                debugPrint("$index");
              },
            ),
            SizedBox(height: 40),
            WaveBottomBar(
              amplitude: 42,
              waveLength: 120,
              activeTopMargin: -25,
              items: BarItem.fixed,
              removeBottom: true,
              type: WaveBottomBarType.fixed,
              direction: WaveBottomBarDirection.down,
              onTap: (index) {
                debugPrint("$index");
              },
            ),
            SizedBox(height: 40),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: WaveBottomBar(
                width: MediaQuery.of(context).size.width - 60,
                items: BarItem.simpleUse,
                removeBottom: true,
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
            SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: WaveBottomBar(
        items: BarItem.simpleUse,
        onTap: (index) {
          debugPrint("$index");
        },
      ),
    );
  }
}
