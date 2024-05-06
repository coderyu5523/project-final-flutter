import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/constants.dart';

class TodayChangesChart extends StatelessWidget {
  const TodayChangesChart({
    super.key,
    required this.fatData,
    required this.muscleData,
    required this.weightData,
  });

  final List<FlSpot> fatData;
  final List<FlSpot> muscleData;
  final List<FlSpot> weightData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 230,
      child: LineChart(
        LineChartData(
          backgroundColor: Colors.white,
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(
            show: true,
            border: Border(
              bottom: BorderSide(color: TColor.secondaryColor1.withOpacity(0.2), width: 4),
              left: BorderSide(color: TColor.secondaryColor1.withOpacity(0.2), width: 4),
              right: const BorderSide(color: Colors.transparent),
              top: const BorderSide(color: Colors.transparent),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: fatData,
              isCurved: true,
              color: Colors.lightGreenAccent,
              barWidth: 3,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(
                show: false,
                color: Colors.amberAccent.withOpacity(0),
              ),
            ),
            LineChartBarData(
              spots: muscleData,
              isCurved: true,
              color: Colors.cyanAccent,
              barWidth: 3,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(show: false),
            ),
            LineChartBarData(
              spots: weightData,
              isCurved: true,
              color: Colors.deepPurpleAccent,
              barWidth: 3,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(show: false),
            ),
          ],
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  return Text('${value.toInt()}kg',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 11));
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  return Text('Day ${value.toInt() + 1}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 11));
                },
              ),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          minX: 0,
          maxX: 4,
          minY: 0,
          maxY: 150,
        ),
      ),
    );
  }
}
