import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:project_app/_core/constants/style.dart';
import 'package:project_app/data/dtos/user/user_response.dart';

import '../../../../../_core/constants/size.dart';
import '../../../../data/dtos/my/my_response.dart';
import '../../../_common/components/composition_box2.dart';

class MyStatus extends StatelessWidget {
  final MyPageDTO myPageDTO;

  MyStatus(this.myPageDTO);


  @override
  Widget build(BuildContext context) {
    return Container(
      color: kAccentColor2,
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: gap_sm, left: gap_sm, right: gap_sm),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CompositionBox2(
                  name: "체지방",
                  titleColor: kAccentColor2,
                  borderColor: Colors.white, onTap: () {  },
                  value: "${myPageDTO.fat}",
                ),
                SizedBox(width: gap_s),
                CompositionBox2(
                  name: "골격근",
                  titleColor: kAccentColor2,
                  borderColor: Colors.white, onTap: () {  },
                  value: "${myPageDTO.muscle}",
                ),
                SizedBox(width: gap_s),
                CompositionBox2(
                  name: "체중",
                  titleColor: kAccentColor2,
                  borderColor: Colors.white, onTap: () {  },
                  value: "${myPageDTO.weight}",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
