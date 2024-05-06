import 'package:flutter/material.dart';

import 'activity_card_widget.dart';

class ActivityStatsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ActivityCardWidget(data: '310 kcal', label: '칼로리'),
        ActivityCardWidget(data: '7500', label: '총 걸음수'),
      ],
    );
  }
}