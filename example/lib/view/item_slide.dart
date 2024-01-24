import 'package:flutter/material.dart';

class ItemSlideWidget extends StatelessWidget {
  final String title;
  final double value;
  final double min;
  final double max;
  final int divisions;
  final Function(double value) onChanged;

  ItemSlideWidget({
    required this.title,
    required this.value,
    required this.min,
    required this.max,
    required this.divisions,
    required this.onChanged,
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
            child: Text(title),
          ),
          Expanded(
            child: Slider(
              value: value,
              min: min,
              max: max,
              divisions: divisions,
              onChanged: (value) {
                onChanged(value.roundToDouble());
              },
            ),
          ),
          SizedBox(
            width: 30,
            child: Text("$value"),
          ),
        ],
      ),
    );
  }
}
