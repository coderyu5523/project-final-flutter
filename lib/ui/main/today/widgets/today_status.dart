import 'package:flutter/material.dart';

import '../../../../../_core/constants/size.dart';
import '../../../../../_core/constants/style.dart';
import 'today_goal.dart';

class TodayStatus extends StatelessWidget {
  final name;
  final weight;
  final goalWeight;

  TodayStatus(
      {required this.name, required this.weight, this.goalWeight = "-"});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(gap_m),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Text(
                    "${name}",
                    style: subtitle3(mColor: Colors.grey[400]!),
                  ),
                  Spacer(),
                  Text("${weight}kg"),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 100,
              child: Text(
                "${goalWeight}kg",
                style: h6(),
              ),
            ),
            Expanded(
              child: TodayGoal(),
            ),
          ],
        ),
      ),
    );
  }
}
