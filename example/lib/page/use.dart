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
      appBar: AppBar(
        title: Text('Use'),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Container(
            color: getRandomColor(),
            alignment: Alignment.center,
            child: Text(
              "This is test content bg",
              style: TextStyle(color: Colors.grey.shade500),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50),
                WaveBottomBar(
                  items: BarItem.simpleUse,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
