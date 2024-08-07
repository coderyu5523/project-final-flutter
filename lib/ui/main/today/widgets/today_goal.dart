import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/constants.dart';

import '../../../../../_core/constants/style.dart';
import '../viewmodel/today_page_viewmodel.dart';
import 'today_goal_insert.dart';

class TodayGoal extends StatelessWidget {
  final name;
  TodayPageModel model;

  TodayGoal(this.name,this.model);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("목표 설정", style: TextStyle(
                fontSize: 18,
                    fontWeight: FontWeight.bold,
                color: TColor.grey,
              ),),
              content: SingleChildScrollView(
                child: Container(
                  height: 130,
                  // color: Colors.white,
                  child: Center(
                    child: TodayGoalInsert(name,model),
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Text(
        "목표 설정 >",
        style: subtitle2(mColor: Colors.grey[400]!),
      ),
    );
  }
}
