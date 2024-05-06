import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:project_app/_core/constants/style.dart';

import '../../../../_core/constants/size.dart';


class PhysicalInputStat extends StatelessWidget {
  final dataName;
  final value;

  PhysicalInputStat({required this.dataName, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(gap_s),
      ),
      child: Padding(
        padding: const EdgeInsets.all(gap_sm),
        child: Column(
          children: [
            Text("${dataName} 입력", style: subtitle1(mColor: Colors.grey)),
            Text(
              "${value}kg",
              style: h4(),
            ),
            Padding(
              padding: const EdgeInsets.all(gap_s),
              child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: kAccentColor1),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Text("목표 ${dataName} 설정",
                      style: subtitle3(mColor: kAccentColor1))),
            ),
          ],
        ),
      ),
    );
  }
}
