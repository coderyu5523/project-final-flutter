import 'package:flutter/material.dart';

class LastUpdate extends StatelessWidget {
  final String lastUpdated;

  const LastUpdate({Key? key, required this.lastUpdated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        '최근 업데이트 : $lastUpdated',
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
    );
  }
}
