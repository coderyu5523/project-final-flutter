import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/ui/main/activity/viewmodel/activity_main_viewmodel.dart';
import '../../../../../data/models/activities/activity.dart';
import '../../../../data/models/activities/activity.dart';
import '../../../../data/models/activities/activity.dart';
import '../../../../data/models/activities/activity.dart';
import 'activity_body_title.dart';
import 'metric_grid.dart';

class ActivityBody extends ConsumerWidget {
  final DateTime selectedDate;

  const ActivityBody({Key? key, required this.selectedDate}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
   ref.read(ActivityMainProvider.notifier).notifyInit(selectedDate);
   ActivityMainModel? model = ref.read(ActivityMainProvider);


   // List<Activity> filteredActivities = model?.activitiesDateDTO?.activities?.where((activity) {
   //   return activity.createdAt.year == selectedDate.year &&
   //       activity.createdAt.month == selectedDate.month &&
   //       activity.createdAt.day == selectedDate.day;
   // }).toList() ?? [];

    return Column(
      mainAxisSize: MainAxisSize.min, // 높이 최소화
      children: [
        ActivityBodyTitle(),
        Expanded(
          child: MetricGrid(model: model), // 필터링된 데이터 전달
        ),
      ],
    );
  }
}