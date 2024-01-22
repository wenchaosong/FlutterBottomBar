import 'package:flutter/material.dart';

import 'page/common.dart';
import 'page/home.dart';
import 'page/wave.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/home": (context) => HomePage(),
        "/common": (context) => CommonPage(),
        "/wave": (context) => WavePage(),
      },
      home: HomePage(),
    );
  }
}
