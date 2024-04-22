import 'package:flutter/cupertino.dart';
import 'layout/challenge_body.dart';

class ChallengePage extends StatelessWidget {
  const ChallengePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ChallengeBody(),
      ],
    );
  }
}
