import 'package:flutter/material.dart';
import '../../../../_core/constants/constants.dart';

void showInputModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // 키보드가 모달을 가리지 않도록 설정
    builder: (BuildContext context) {
      return Theme(
        data: Theme.of(context).copyWith(
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: kAccentColor2),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kAccentColor2, width: 2.0),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          textTheme: TextTheme(
            titleMedium: TextStyle(color: kAccentColor2),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom, // 키보드로 인한 여백 조정
            left: 30,
            right: 30,
            top: 30,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: '체지방 (%)',
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(color: TColor.grey),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '골격근 (%)',
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(color: TColor.grey),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '체중 (kg)',
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(color: TColor.grey),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kAccentColor2,
                  foregroundColor: Colors.white,
                ),
                child: Text('저장'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
