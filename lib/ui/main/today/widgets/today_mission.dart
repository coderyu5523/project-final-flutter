import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../_core/constants/size.dart';
import '../../../../../_core/constants/style.dart';
import '../../../../_core/constants/constants.dart';

class TodayMission extends StatelessWidget {
  final String title;
  final String title2;
  final String subtitle;
  final IconData icons;
  final Widget page;
  final double progress; // 진행 상태를 표시하는 변수

  TodayMission({
    this.title = "",
    this.title2 = "",
    required this.subtitle,
    required this.icons,
    required this.page,
    this.progress = 0.5, // 진행 상태를 50%로 설정
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HapticFeedback.lightImpact(); // 진동 효과
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          color: TColor.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(gap_sm),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "$title",
                              style: h6(mColor: kAccentColor2),
                            ),
                            TextSpan(
                              text: "$title2",
                              style: h6(mColor: Colors.black38),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "$subtitle",
                        style: subtitle2(mColor: Colors.black38),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    icons,
                    size: 50,
                    color: kAccentColor2, // 아이콘 색상 변경
                  ),
                ],
              ),
              SizedBox(height: 8), // 프로그레스 바와 텍스트 사이 간격 추가
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(kAccentColor2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
