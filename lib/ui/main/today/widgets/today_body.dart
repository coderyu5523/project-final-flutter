import 'package:flutter/material.dart';
import 'package:project_app/ui/main/today/widgets/today_changes_chart.dart';
import 'package:project_app/ui/main/today/widgets/my_changes.dart';

import '../../../../../_core/constants/size.dart';
import '../../../../../_core/constants/style.dart';
import '../../../../../data/models/chartDummy.dart';
import '../../../_common/components/composition_box2.dart';
import '../pages/my_changes_page.dart';
import 'today_mission_list.dart';

class TodayBody extends StatefulWidget {
  @override
  State<TodayBody> createState() => _TodayBodyState();
}

class _TodayBodyState extends State<TodayBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TodayMissionList(),
      ],
    );
  }
}