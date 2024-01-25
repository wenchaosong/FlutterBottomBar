import 'package:flutter/material.dart';

import '../data/radio_data.dart';

class ItemRadioWidget extends StatelessWidget {
  final String title;
  final List<RadioData> items;

  ItemRadioWidget({
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> sub = [];
    sub.add(SizedBox(
      width: 120,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Text(title),
      ),
    ));
    sub.add(Expanded(child: Container()));
    items.forEach((element) {
      sub.add(
        Radio(
          value: "${element.value}",
          groupValue: "${element.groupValue}",
          onChanged: (value) {
            element.onChanged(value!);
          },
        ),
      );
      sub.add(Text("${element.title}"));
      sub.add(Expanded(child: Container()));
    });
    return Container(
      height: 45,
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1)),
      ),
      child: Row(children: sub),
    );
  }
}
