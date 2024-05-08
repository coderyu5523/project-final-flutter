import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/ui/main/today/widgets/today_bodydata.dart';
import 'package:project_app/ui/main/today/widgets/today_changes_chart.dart';
import 'package:project_app/ui/main/today/widgets/today_changes_detail.dart';
import 'package:project_app/ui/main/today/widgets/today_user_data.dart';

import '../../../../_core/constants/size.dart';
import '../../../../data/models/chartDummy.dart';
import '../viewmodel/visibility_state_viewmodel.dart';
import '../viewmodel/today_page_viewmodel.dart';
import 'last_update.dart';
import 'my_changes.dart';

class TodayHeader extends ConsumerWidget {
  final visibilityState;
  TodayPageModel? model;

  TodayHeader(this.visibilityState, this.model);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 상태 변경 함수
    void toggleVisibility(String type) {
      if (type == 'fat')
        ref.read(visibilityProvider.notifier).toggleFatVisibility();
      if (type == 'muscle')
        ref.read(visibilityProvider.notifier).toggleMuscleVisibility();
      if (type == 'weight')
        ref.read(visibilityProvider.notifier).toggleWeightVisibility();
    }


    return Column(
      children: [
        TodayUserData(model!),
        Padding(
          padding: const EdgeInsets.all(gap_m),
          child: Column(
            children: [
              TodayChangesDetail(model,ref),
              SizedBox(height: gap_l),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: gap_l),
                child: TodayChangesChart(
                  fatData: visibilityState.fatVisible ? FatDataFromModel(model) : [],
                  muscleData: visibilityState.muscleVisible ? MuscleDataFromModel(model) : [],
                  weightData: visibilityState.weightVisible ? WeightDataFromModel(model) : [],
                ),
              ),
              SizedBox(height: gap_m),
              TodayBodydata(
                model: model,
                toggleVisibility: toggleVisibility,
                fatVisible: visibilityState.fatVisible,
                muscleVisible: visibilityState.muscleVisible,
                weightVisible: visibilityState.weightVisible,
              ),
              SizedBox(height: gap_s),
              LastUpdate(lastUpdated: '${model?.bodyDataList.last.date}'),
              SizedBox(height: gap_l),
              MyChanges(),
            ],
          ),
        ),
      ],
    );
  }
}
