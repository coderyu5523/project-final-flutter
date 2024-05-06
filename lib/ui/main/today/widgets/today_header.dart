import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/ui/main/today/widgets/today_bodydata.dart';
import 'package:project_app/ui/main/today/widgets/today_changes_chart.dart';
import 'package:project_app/ui/main/today/widgets/today_changes_detail.dart';
import 'package:project_app/ui/main/today/widgets/today_user_data.dart';

import '../../../../_core/constants/size.dart';
import '../../../../data/models/chartDummy.dart';
import '../VisibilityState.dart';
import '../today_page_viewmodel.dart';
import 'last_update.dart';
import 'my_changes.dart';

class TodayHeader extends ConsumerWidget {
  const TodayHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visibilityState = ref.watch(visibilityProvider);
    TodayPageModel? model = ref.watch(TodayPageProvider);

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
              TodayChangesDetail(),
              SizedBox(height: gap_l),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: gap_l),
                child: TodayChangesChart(
                  fatData: visibilityState.fatVisible ? fatData : [],
                  muscleData: visibilityState.muscleVisible ? muscleData : [],
                  weightData: visibilityState.weightVisible ? weightData : [],
                ),
              ),
              SizedBox(height: gap_m),
              TodayBodydata(
                toggleVisibility: toggleVisibility,
                fatVisible: visibilityState.fatVisible,
                muscleVisible: visibilityState.muscleVisible,
                weightVisible: visibilityState.weightVisible,
              ),
              SizedBox(height: gap_s),
              LastUpdate(lastUpdated: '2024년 4월 29일'),
              SizedBox(height: gap_l),
              MyChanges(),
            ],
          ),
        ),
      ],
    );
  }
}
