import 'package:flutter/material.dart';

class BarItem {
  static final List<BottomNavigationBarItem> commonItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home, size: 23, color: Colors.grey),
      activeIcon: Icon(Icons.home, size: 23, color: Colors.blue),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add, size: 23, color: Colors.grey),
      activeIcon: Icon(Icons.add, size: 23, color: Colors.blue),
      label: "Add",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person, size: 23, color: Colors.grey),
      activeIcon: Icon(Icons.person, size: 23, color: Colors.blue),
      label: "Me",
    ),
  ];

  static final List<BottomNavigationBarItem> waveItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home, size: 23, color: Colors.grey),
      activeIcon: ClipOval(
        child: Container(
          width: 45,
          height: 45,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Icon(Icons.home, size: 35, color: Colors.white),
        ),
      ),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add, size: 23, color: Colors.grey),
      activeIcon: ClipOval(
        child: Container(
          width: 45,
          height: 45,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Icon(Icons.add, size: 35, color: Colors.white),
        ),
      ),
      label: "Add",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person, size: 23, color: Colors.grey),
      activeIcon: ClipOval(
        child: Container(
          width: 45,
          height: 45,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Icon(Icons.person, size: 35, color: Colors.white),
        ),
      ),
      label: "Me",
    ),
  ];
}
