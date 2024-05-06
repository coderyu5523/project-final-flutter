import 'package:flutter/material.dart';

import '../../../../../_core/constants/size.dart';
import '../../../../../_core/constants/style.dart';
import '../../../../_core/constants/constants.dart';
import '../../activity/pages/change_weight_detail_page.dart';
import '../../activity/pages/diet_management_detail_page.dart';
import '../../activity/pages/drink_water_detail_page.dart';
import '../../activity/pages/step_count_detail_page.dart';
import 'today_mission.dart';

class TodayMissionList extends StatelessWidget {
  const TodayMissionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: TColor.white),
      child: Padding(
        padding: const EdgeInsets.all(gap_m),
        child: Column(
          children: [
            SizedBox(height: gap_sm),
            Row(
              children: [
                Text("오늘의 미션", style: subtitle1()),
              ],
            ),
            SizedBox(height: gap_l),
            TodayMission(
              title: "0 걸음 ",
              title2: "걸었어요",
              subtitle: "목표 10,000 걸음",
              icons: Icons.directions_walk,
              page: StepCountDetailPage(),
            ),
            SizedBox(height: gap_s),
            TodayMission(
              title: "오늘 0잔 ",
              title2: "마셨어요",
              subtitle: "목표 8잔",
              icons: Icons.local_drink,
              page: DrinkWaterDetailPage(),
            ),
            SizedBox(height: gap_s),
            TodayMission(
              title: "식단 0개 ",
              title2: "기록했어요",
              subtitle: "목표 3개",
              icons: Icons.restaurant,
              page: DietManagementDetailPage(),
            ),
          ],
        ),
      ),
    );
  }
}
