import 'package:flutter/material.dart';

class OngoingChallengeImg extends StatelessWidget {
  const OngoingChallengeImg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/challengedetail.png',
      height: 500.0,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
