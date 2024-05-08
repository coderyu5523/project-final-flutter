import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../_core/constants/constants.dart';
import '../../../../data/dtos/today/today_request.dart';
import '../viewmodel/today_page_viewmodel.dart';

void showInputModal(
    BuildContext context, WidgetRef ref, TodayPageModel? model) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // 키보드가 모달을 가리지 않도록 설정

    builder: (BuildContext context) {
      final _formKey = GlobalKey<FormState>();
      final _fat = TextEditingController();
      final _muscle = TextEditingController();
      final _weight = TextEditingController();

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
                controller: _fat,
                decoration: InputDecoration(
                  labelText: '체지방 (%)',
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(color: TColor.grey),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _muscle,
                decoration: InputDecoration(
                  labelText: '골격근 (%)',
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(color: TColor.grey),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _weight,
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
                  double? fat =
                      double.tryParse(_fat.text) ?? model?.bodyData?.last.fat;
                  double? muscle = double.tryParse(_muscle.text) ??
                      model?.bodyData?.last.muscle;
                  double? weight = double.tryParse(_weight.text) ??
                      model?.bodyData?.last.weight;

                  UpdateBodyDataRequestDTO requestDTO =
                      UpdateBodyDataRequestDTO(fat!, muscle!, weight!);
                  ref
                      .read(TodayPageProvider.notifier)
                      .notifyAddBodyData(requestDTO);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
