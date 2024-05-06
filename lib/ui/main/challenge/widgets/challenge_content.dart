import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChallengeContent extends StatelessWidget {
  final String name;
  final String subtitle;
  final int walking;

  final String content;

  const ChallengeContent({
    Key? key,
    required this.name,
    required this.subtitle,
    required this.walking,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
                overflow: TextOverflow.ellipsis, // 글자가 넘치면 ...으로 표시
              ),
            ),
            Text(
              "${walking}걸음",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          subtitle,
          style: TextStyle(fontSize: 12),
        ),
        SizedBox(height: 10),
        Text(
          content,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
