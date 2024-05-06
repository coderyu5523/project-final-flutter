import 'package:flutter/material.dart';
import '../../../../../data/models/activities/activity.dart';
import '../pages/change_weight_detail_page.dart';
import '../pages/diet_management_detail_page.dart';
import '../pages/drink_water_detail_page.dart';
import '../pages/step_count_detail_page.dart';
import 'metric_card.dart';

class MetricGrid extends StatelessWidget {
  final List<Activity> activities;

  MetricGrid({required this.activities});

  @override
  Widget build(BuildContext context) {
    if (activities.isEmpty) {
      return Center(
        child: Text(
          "데이터가 없습니다",
          style: TextStyle(fontSize: 24, color: Colors.grey[800]),
        ),
      );
    } else {
      List<Widget> cards = buildActivityCards(context);
      return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: (1 / 1.5),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: EdgeInsets.all(10),
        children: cards,
      );
    }
  }

  List<Widget> buildActivityCards(BuildContext context) {
    return activities.map((activity) {
      return MetricCard(
        title: getTitleForActivity(activity),
        subtitle: getSubtitleForActivity(activity),
        trailing: formatTimeAgo(activity.createdAt),
        percentage: 40,
        onTap: () => navigateToDetailPage(context, activity),
        hasData: checkDataPresence(activity),
      );
    }).toList();
  }


  bool checkDataPresence(Activity activity) {
    return activity.walking != null || activity.drinkWater != null || activity.kcal != null || activity.weight != null;
  }

  String getTitleForActivity(Activity activity) {
    // Example logic, needs to be customized based on actual data
    if (activity.walking != null) return 'STEPS';
    if (activity.drinkWater != null) return 'WATER';
    if (activity.kcal != null) return 'CALORIES';
    if (activity.weight != null) return 'WEIGHT';
    return 'DATA MISSING';
  }

  String getSubtitleForActivity(Activity activity) {
    // Example logic, you should adjust it according to your data structure
    if (activity.walking != null) return '${activity.walking} steps';
    if (activity.drinkWater != null) return '${activity.drinkWater} cups';
    if (activity.kcal != null) return '${activity.kcal} kcal';
    if (activity.weight != null) return '${activity.weight} kg';
    return '측정된 데이터가 없습니다';
  }

  void navigateToDetailPage(BuildContext context, Activity activity) {
    // Navigate to the appropriate detail page based on activity data
    if (activity.walking != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => StepCountDetailPage()));
    } else if (activity.drinkWater != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => DrinkWaterDetailPage()));
    } else if (activity.kcal != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => DietManagementDetailPage()));
    } else if (activity.weight != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeWeightDetailPage()));
    }
  }

  String formatTimeAgo(DateTime time) {
    final DateTime now = DateTime.now();
    final Duration difference = now.difference(time);

    if (difference.inDays > 0) {
      return '${difference.inDays}일 전';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}시간 전';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}분 전';
    } else {
      return '방금 전';
    }
  }
}