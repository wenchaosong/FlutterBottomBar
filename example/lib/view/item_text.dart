import 'package:flutter/material.dart';

class ItemTextWidget extends StatelessWidget {
  final String title;
  final Widget subWidget;

  ItemTextWidget({
    required this.title,
    required this.subWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1)),
      ),
      child: Row(
        children: [
          Text(title),
          SizedBox(width: 25),
          Expanded(child: subWidget),
        ],
      ),
    );
  }
}
