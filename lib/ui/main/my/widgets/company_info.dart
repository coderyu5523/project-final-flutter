import 'package:flutter/material.dart';

class CompanyInfo extends StatelessWidget {
  const CompanyInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "(주)Bodykey\n\n",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            TextSpan(
              text: "고객센터 1234-5678 (유료)\n",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            TextSpan(
              text: "평일 09:00 ~ 18:00 (토/일/공휴일 휴무)\n",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            TextSpan(
              text: "(break time 12:00 ~ 13:00)",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
