import 'package:flutter/material.dart';

class BarItem {
  static final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home, size: 23, color: Colors.grey),
      activeIcon: Icon(Icons.home, size: 45, color: Colors.blue),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add, size: 23, color: Colors.grey),
      activeIcon: Icon(Icons.add, size: 45, color: Colors.blue),
      label: "Add",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person, size: 23, color: Colors.grey),
      activeIcon: Icon(Icons.person, size: 45, color: Colors.blue),
      label: "Me",
    ),
  ];
}
