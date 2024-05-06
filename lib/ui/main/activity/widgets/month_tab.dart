import 'package:flutter/material.dart';

import '../../../../_core/constants/constants.dart';

class MonthTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int totalMonthlySteps = 240000;
    int averageDailySteps = 8000;
    double averageAchievementRate = 75.0;
    String maxStepDay = "2024-04-15";
    int maxSteps = 15000;

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: TColor.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Text("한달 총 걸음수: $totalMonthlySteps 걸음"),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          Text("한달 평균 걸음수: $averageDailySteps 걸음"),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          Text("한달 평균 달성률: $averageAchievementRate%"),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          Text("가장 많이 걸은 날: $maxStepDay ($maxSteps 걸음)"),
          SizedBox(height: 10),
          Divider(),
        ],
      ),
    );
  }
}
