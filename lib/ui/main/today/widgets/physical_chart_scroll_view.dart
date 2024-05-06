import 'package:flutter/material.dart';
import 'package:project_app/ui/main/today/widgets/physical_chart_input.dart';
import 'package:project_app/ui/main/today/widgets/physical_data.dart';

import '../../../../_core/constants/size.dart';


class PhysicalChartScrollView extends StatelessWidget {
  final dataName;
  final chartData;
  final dataValue;
  final chartColor;

  PhysicalChartScrollView(
      {required this.dataName,
      required this.chartData,
      required this.dataValue,
      this.chartColor});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(gap_sm),
        child: Column(
          children: [
            SizedBox(height: gap_m),
            PhysicalChartInput(
              dataName: dataName,
              chartData: chartData,
              dataValue: dataValue,
              chartColor: chartColor,
            ),
            SizedBox(height: gap_m),
            PhysicalData(),
          ],
        ),
      ),
    );
  }
}
