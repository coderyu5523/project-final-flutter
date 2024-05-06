import 'package:flutter/material.dart';

class OngoingChallengePercent extends StatelessWidget {
  const OngoingChallengePercent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text("50.2%/100%",
              style: TextStyle(fontSize: 15)), // Example step count
        ),
        Expanded(
          child: Text("현재 5만걸음/총 10만걸음",
              style: TextStyle(fontSize: 15)), // Example step count
        ),
      ],
    );
  }
}
