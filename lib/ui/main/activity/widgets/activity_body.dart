import 'package:flutter/material.dart';
import '../../../../../data/models/activities/activity.dart';
import 'activity_body_title.dart';
import 'metric_grid.dart';

class ActivityBody extends StatelessWidget {
  final DateTime selectedDate;

  const ActivityBody({Key? key, required this.selectedDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Activity> filteredActivities = activities.where((activity) {
      return activity.createdAt.year == selectedDate.year &&
          activity.createdAt.month == selectedDate.month &&
          activity.createdAt.day == selectedDate.day;
    }).toList();
    return Column(
      mainAxisSize: MainAxisSize.min, // 높이 최소화
      children: [
        ActivityBodyTitle(),
        Expanded(
          child: MetricGrid(activities: filteredActivities), // 필터링된 데이터 전달
        ),
      ],
    );
  }
}