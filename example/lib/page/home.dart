import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 15, right: 15),
            child: ElevatedButton(
              child: Text("Common Bar"),
              onPressed: () {
                Navigator.pushNamed(context, "/common");
              },
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 15, top: 15, right: 15),
            child: ElevatedButton(
              child: Text("Wave Bar"),
              onPressed: () {
                Navigator.pushNamed(context, "/wave");
              },
            ),
          ),
        ],
      ),
    );
  }
}
