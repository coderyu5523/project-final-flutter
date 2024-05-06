import 'package:flutter/material.dart';

class ChallengeName extends StatelessWidget {
  final String name;

  const ChallengeName({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
      softWrap: true,  // 줄바꿈 활성화
      overflow: TextOverflow.visible,  // 텍스트가 영역을 넘어갈 경우 보이도록 설정
    );
  }
}
