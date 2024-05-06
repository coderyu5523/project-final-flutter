import 'package:flutter/material.dart';
import 'package:project_app/ui/main/activity/widgets/step_count_progress.dart';

import 'day_tab.dart';
import 'month_tab.dart';
import 'week_tab.dart';
import 'activity_stats_row.dart';

class StepCountBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        StepCountProgress(),
        ActivityStatsRow(),
        Expanded(
          flex: 3,
          child: TabBarView(
            children: [
              DayTab(),
              WeekTab(),
              MonthTab(),
            ],
          ),
        ),
      ],
    );
  }
}