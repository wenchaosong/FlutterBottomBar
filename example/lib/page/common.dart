import 'package:flutter/material.dart';

import '../view/item_bar.dart';

class CommonPage extends StatefulWidget {
  const CommonPage({super.key});

  @override
  State<StatefulWidget> createState() => _CommonPageState();
}

class _CommonPageState extends State<CommonPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('Common Bar'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text("${BarItem.items[_currentIndex].label}"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 10,
        selectedLabelStyle: TextStyle(fontSize: 12),
        unselectedLabelStyle: TextStyle(fontSize: 12),
        items: BarItem.items,
        onTap: (index) {
          _currentIndex = index;
          setState(() {});
        },
      ),
    );
  }
}