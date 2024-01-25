import 'package:flutter/material.dart';

class ItemSelectWidget extends StatelessWidget {
  final String title;
  final Curve initCurve;
  final List<Curve> curveList;
  final Function(Curve? value) onSelect;

  ItemSelectWidget({
    required this.title,
    required this.initCurve,
    required this.curveList,
    required this.onSelect,
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
          SizedBox(
            width: 120,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(title),
            ),
          ),
          Expanded(
            child: DropdownMenu(
              initialSelection: initCurve,
              onSelected: (Curve? value) {
                onSelect(value);
              },
              expandedInsets: EdgeInsets.only(left: 20, right: 20),
              dropdownMenuEntries:
                  curveList.map<DropdownMenuEntry<Curve>>((Curve c) {
                return DropdownMenuEntry<Curve>(
                  value: c,
                  label: c.toString(),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
