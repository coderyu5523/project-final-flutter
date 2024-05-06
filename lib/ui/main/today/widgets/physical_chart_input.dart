import 'package:flutter/material.dart';
import 'package:project_app/ui/main/today/widgets/physical_input_stats.dart';

import '../../../../_core/constants/size.dart';
import '../../../_common/components/single_chart.dart';

class PhysicalChartInput extends StatelessWidget {
  final chartData;
  final dataName;
  final dataValue;
  final chartColor;

  PhysicalChartInput(
      {required this.chartData,
      required this.dataName,
      required this.dataValue,
      this.chartColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 400,
          child: Padding(
            padding: const EdgeInsets.all(gap_sm),
            child: SingleChart(
              chartData: chartData,
              color: chartColor,
            ),
          ),
        ),
        SizedBox(height: gap_m),
        PhysicalInputStat(dataName: dataName, value: dataValue),
      ],
    );
  }
}
