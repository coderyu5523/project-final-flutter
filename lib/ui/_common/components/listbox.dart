import 'package:flutter/material.dart';
class Listbox extends StatelessWidget {
  const Listbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.0, vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      // 실제 내용을 추가할 자리
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          // 데이터 표시 예정인 곳에 Placeholder 사용
          Placeholder(fallbackHeight: 20.0, color: Colors.transparent),
          SizedBox(height: 10),
          Placeholder(fallbackHeight: 20.0, color: Colors.transparent),
        ],
      ),
    );
  }
}