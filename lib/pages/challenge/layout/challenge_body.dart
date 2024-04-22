import 'package:flutter/material.dart';
import '../components/badge_menu.dart';  // 이 경로를 수정하세요.
import '../components/challenge_section.dart';

class ChallengeBody extends StatelessWidget {
  const ChallengeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ChallengeSection(title: '탐험 시작하기', badges: available),
        ChallengeSection(title: '진행중인 챌린지', badges: ongoing),
        ChallengeSection(title: '지난 챌린지', badges: completed),
      ],
    );
  }
}
