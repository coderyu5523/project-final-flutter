import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/constants.dart';
import '../../../../../_core/constants/move.dart';

class TodayGoalInsert extends StatelessWidget {
  const TodayGoalInsert({
    Key? key,
  }) : super(key: key);

  //todo: composition_box 를 서로 공유하고 있어 목표 설정이 같이 됨. 확인 필요
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: kAccentColor2,
            ),
      ),
      child: Column(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: '목표량',
                  labelStyle: TextStyle(fontSize: 15, color: TColor.darkGrey),
                  hintText: '목표량을 입력하세요',
                  hintStyle: TextStyle(color: TColor.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: kAccentColor2))),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Move.loginPage);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kAccentColor2,
                foregroundColor: Colors.white,
                elevation: 10,
              ),
              child: const Text(
                '입력 완료',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
