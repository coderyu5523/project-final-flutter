import 'package:flutter/material.dart';
import '../viewmodel/walking_detail.viewmodel.dart';
import 'weekly_bar_chart.dart';

class WeekTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: WeeklyBarChart(),
    );
  }
}
