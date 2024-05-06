import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:project_app/data/dtos/challenge/challenge_response.dart';

import '../pages/ongoing_challenge_detail_page.dart';

class HexagonClipper extends CustomClipper<Path> {
  final double radius; // 반지름을 직접 제어

  HexagonClipper({this.radius = 50.0});

  @override
  Path getClip(Size size) {
    final path = Path();
    double angle = math.pi / 3; // 육각형 한 꼭지점의 각도
    Offset center = Offset(size.width / 2, size.height / 2);

    // 육각형의 첫 번째 꼭지점을 시작점으로 설정
    Offset startPoint = Offset(
        center.dx + radius * math.cos(0), center.dy + radius * math.sin(0));
    path.moveTo(startPoint.dx, startPoint.dy);

    // 6개의 꼭지점 생성
    for (int i = 1; i <= 6; i++) {
      double x = center.dx + radius * math.cos(angle * i);
      double y = center.dy + radius * math.sin(angle * i);
      path.lineTo(x, y);
    }
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return (oldClipper is HexagonClipper) && oldClipper.radius != this.radius;
  }
}

class OngoingChallengeContainer extends StatelessWidget {
  final AttendChallenge challenge;

  const OngoingChallengeContainer({Key? key, required this.challenge})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final int daysLeft = challenge.closingTime?.difference(now).inDays ?? 0;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                OngoingChallengeDetailPage(challenge: challenge),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.teal.shade100,
              ),
              child: ClipPath(
                clipper: HexagonClipper(radius: 40),
                child: Image.memory(base64Decode(challenge.backImg),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(challenge.challengeName,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('${challenge.subtitle} ',
                      style: TextStyle(color: Colors.grey)),
                  if (challenge.closingTime != null)
                    Text('마감까지 $daysLeft일 남음',
                        style: TextStyle(color: Colors.red)),
                  Text('이번 도전으로 ${challenge.coin} 코인 획득가능',
                      style: TextStyle(color: Colors.green)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
