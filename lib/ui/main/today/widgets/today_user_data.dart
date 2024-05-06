import 'package:flutter/material.dart';
import 'package:project_app/ui/main/today/viewmodel/today_page_viewmodel.dart';
import 'package:project_app/ui/main/today/widgets/today_status.dart';

import '../../../../_core/constants/constants.dart';
import '../../../../_core/constants/size.dart';
import '../../../../_core/constants/style.dart';

class TodayUserData extends StatelessWidget {
  TodayPageModel model;

  TodayUserData(this.model);

  @override
  Widget build(BuildContext context) {

    return Container(
      // color: kAccentColor1,
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/green.png'),
          fit: BoxFit.cover,
        ),
        color: kAccentColor2, // 이미지 로드 실패 시 대체 색상
      ),
      child: Padding(
        padding: EdgeInsets.all(gap_m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: gap_s),
            Text(
              "${model.mainDTO.name}님",
              style: h4(mColor: kAccentColor2),
            ),
            const SizedBox(height: gap_s),
            Text(
              "반갑습니다!",
              style: subtitle1(mColor: Colors.blueGrey),
            ),
            SizedBox(height: gap_m),
            Row(
              children: [
                Expanded(child: TodayStatus(name: "체지방", weight: model.mainDTO.fat)),
                SizedBox(width: gap_s),
                Expanded(child: TodayStatus(name: "골격근", weight: model.mainDTO.muscle)),
                SizedBox(width: gap_s),
                Expanded(child: TodayStatus(name: "체중", weight: model.mainDTO.weight)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
