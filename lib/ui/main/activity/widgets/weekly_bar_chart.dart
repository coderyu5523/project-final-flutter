import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeeklyBarChart extends StatefulWidget {
  @override
  _WeeklyBarChartState createState() => _WeeklyBarChartState();
}

class _WeeklyBarChartState extends State<WeeklyBarChart> {
  final List<double> weeklyData = [5, 6.5, 5, 7.5, 9, 11.5, 6.5];
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20), // 차트 위쪽에 간격 추가
            child: Text(
              "주간 통계",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey, // 제목 색상 설정
              ),
            ),
          ),
          SizedBox(height: 20), // 제목과 차트 사이의 간격 추가
          Expanded(
            child: AspectRatio(
              aspectRatio: 1.7,
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                color: Colors.transparent,
                child: BarChart(
                  mainBarData(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          tooltipPadding: EdgeInsets.all(8),
          tooltipMargin: 5,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            return BarTooltipItem(
              '${getWeekDay(group.x)}: ${rod.toY.toString()}',
              TextStyle(color: Colors.white),
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          if (!event.isInterestedForInteractions ||
              barTouchResponse == null ||
              barTouchResponse.spot == null) {
            setState(() {
              touchedIndex = -1;
            });
          } else {
            setState(() {
              touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
            });
          }
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            getTitlesWidget: getWeekdayTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false), // y축 라벨 숨기기
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false), // 상단 라벨 숨기기
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false), // 오른쪽 라벨 숨기기
        ),
      ),
      borderData: FlBorderData(show: false),
      barGroups: showingGroups(),
      gridData: FlGridData(show: false),
      backgroundColor: Colors.transparent,
    );
  }

  List<BarChartGroupData> showingGroups() {
    return List.generate(7, (index) {
      return makeGroupData(index, weeklyData[index],
          isTouched: index == touchedIndex);
    });
  }

  BarChartGroupData makeGroupData(int x, double y, {bool isTouched = false}) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: isTouched ? Colors.yellow : Colors.greenAccent,
          width: 16,
        ),
      ],
    );
  }

  String getWeekDay(int index) {
    const weekDays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    return weekDays[index % weekDays.length];
  }

  Widget getWeekdayTitles(double value, TitleMeta meta) {
    final styles = TextStyle(
        color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14);
    final days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: Text(days[value.toInt()], style: styles),
    );
  }
}
