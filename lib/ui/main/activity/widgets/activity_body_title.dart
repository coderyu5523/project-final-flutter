import 'package:flutter/material.dart';

import '../../../../../_core/constants/size.dart';
import '../../../../../_core/constants/style.dart';
import '../pages/add_activity_page.dart';

class ActivityBodyTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gap_sm),
      child: Row(
        children: [
          Text("일일 통계", style: subtitle1()),
          Spacer(),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddActivityPage()),
              );
            },
            child: Text(
              "활동 추가하기",
              style: subtitle2(),
            ),
          ),
        ],
      ),
    );
  }
}
