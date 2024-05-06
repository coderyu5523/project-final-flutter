import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../data/models/chartDummy.dart';


class SingleChart extends StatelessWidget {
  final List<FlSpot> chartData;
  final color;

  SingleChart({required this.chartData, this.color = Colors.red});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        backgroundColor: Colors.white,
        gridData: FlGridData(show: false),
        // 그래프 설정
        lineBarsData: [
          LineChartBarData(
            spots: chartData,
            isCurved: true,
            color: color,
            barWidth: 4,
            isStrokeCapRound: true,
            belowBarData: BarAreaData(show: false),
          ),
        ],
        titlesData: FlTitlesData(
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true, reservedSize: 28)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
            ),
          ),
        ),
        borderData: FlBorderData(show: true),
        minX: 0,
        maxX: 4,
        maxY: maxY(chartData) * 1.3,
        minY: 0,
      ),
    );
  }
}
