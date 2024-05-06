import 'package:flutter/material.dart';

class ActivityCardWidget extends StatelessWidget {
  final String data;
  final String label;

  ActivityCardWidget({required this.data, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(data, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
