import 'package:flutter/material.dart';
import '../../../../_core/constants/line.dart';

class ResponseTab extends StatelessWidget {
  final List<String> responses = ['답변 완료', '답변 대기'];

  ResponseTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Text(
            "상담시간: 월~금 09:00 ~18:00\n(점심시간 12:00~13:00, 토/일/공휴일 휴무)\n\n"
                "답변이 완료된 상담 내용은 수정이 불가능하오니 서비스 이용에 참고 부탁드립니다.",
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
        line2,
        buildSection('답변 완료', Icons.check, Colors.green),
        Container(
          height: 150,
          color: Colors.grey[100],
        ),
        buildSection('답변 대기', Icons.hourglass_empty, Colors.amber),
        Container(
          height: 150,
          color: Colors.grey[100],
        ),
      ],
    );
  }

  Widget buildSection(String title, IconData icon, Color iconColor) {
    return ListTile(
      title: Text(title),
      trailing: Icon(icon, color: iconColor),
    );
  }
}
