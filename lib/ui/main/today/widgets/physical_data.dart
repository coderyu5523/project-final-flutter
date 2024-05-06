import 'package:flutter/material.dart';

import '../../../../_core/constants/size.dart';
import '../../../../_core/constants/style.dart';

class PhysicalData extends StatelessWidget {
  const PhysicalData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("체지방 데이터", style: h7()),
            Spacer(),
            Container(
              alignment: Alignment.center,
              width: gap_l,
              height: gap_m,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                border: Border.all(color: Colors.grey),
              ),
              child: Text("편집", style: subtitle3()),
            ),
          ],
        ),
        SizedBox(height: gap_sm),
        Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              child: Padding(
                padding: const EdgeInsets.all(gap_s),
                child: Text("2024.04", style: subtitle2()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(gap_s),
              child: Row(
                children: [
                  Text("04월 17일"),
                  Spacer(),
                  Text("14.2"),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
