import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:project_app/_core/constants/style.dart';
import 'package:project_app/ui/main/today/widgets/today_bodydata.dart';
import 'package:project_app/ui/main/today/widgets/today_changes_chart.dart';
import 'package:project_app/ui/main/today/widgets/today_changes_detail.dart';

import '../../../../../_core/constants/size.dart';
import '../../../../data/models/chartDummy.dart';
import 'today_status.dart';

class TodayHeader extends StatelessWidget {
  const TodayHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: kAccentColor1,
          width: double.infinity,
          height: 350,
          child: Padding(
            padding: EdgeInsets.all(gap_m),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "류재성님",
                  style: h5(mColor: Colors.white),
                ),
                SizedBox(height: gap_s),
                Text(
                  "오늘의 미션을 수행해보세요!",
                  style: subtitle1(mColor: Colors.white),
                ),
                SizedBox(height: gap_m),
                Row(
                  children: [
                    Expanded(child: TodayStatus(name: "체지방", weight: 14.2)),
                    SizedBox(width: gap_s),
                    Expanded(child: TodayStatus(name: "골격근", weight: 35.6)),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(gap_m),
          child: Column(
            children: [
              TodayChangesDetail(),
              SizedBox(height: gap_l),
              TodayChangesChart(
                fatData: fatData,
                muscleData: muscleData,
                weightData: weightData,
              ),
              SizedBox(height: gap_l),
              TodayBodydata(),
            ],
          ),
        ),
      ],
    );
  }
}
