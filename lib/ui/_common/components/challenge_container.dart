import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_app/data/dtos/challenge/challenge_response.dart';

import 'challenge_name.dart';
import 'hexagon_clipper.dart';

class ChallengeContainer extends StatelessWidget {
  final ChallengeListDTO challenge;

  const ChallengeContainer({Key? key, required this.challenge})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double imageWidth = MediaQuery.of(context).size.width * 0.2;
    final double imageHeight = imageWidth;

    return InkWell(
      onTap: () {
        // todo : 디테일 viewmodel 구현 후 주석 해제
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => ChallengeDetailPage(challenge: challenge)),  // 수정된 부분
        // );
      },
      // todo : 챌린지 성공 여부 값(status)에 따라 다르게 화면 보여지기
      child: Container(
        width: imageWidth,
        color: Colors.white.withOpacity(0.3),
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ClipPath(
                  clipper: HexagonClipper(),
                  child: Image.memory(base64Decode(challenge.badgeImg),
                      fit: BoxFit.cover,
                      height: imageHeight,
                      width: imageWidth),
                ),
                Positioned(
                  bottom: 4,
                  child: Text(
                    challenge.distance,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(150, 0, 0, 0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: ChallengeName(name: challenge.challengeName),
            ),
          ],
        ),
      ),
    );
  }
}
