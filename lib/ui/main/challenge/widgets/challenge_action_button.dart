import 'package:flutter/material.dart';

import '../../../../data/models/challenges/challenge.dart';

class ChallengeActionButton extends StatelessWidget {
  final ChallengeStatus status;

  const ChallengeActionButton({Key? key, required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return status == ChallengeStatus.pending
        ? SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // 참가 시작 기능 구현
              },
              child: Text('탐험 시작하기'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          )
        : Row(
            children: <Widget>[
              Icon(Icons.check_circle, color: Colors.green, size: 30),
              SizedBox(width: 8),
              Text(
                '정복한 챌린지입니다',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
  }
}
