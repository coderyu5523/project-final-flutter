import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:project_app/_core/constants/constants.dart';

class MetricCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String trailing;
  final VoidCallback onTap;
  final double? percentage;
  final bool hasData;

  MetricCard({
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.onTap,
    this.percentage,
    this.hasData = true,
  });

  @override
  Widget build(BuildContext context) {
    final bool isCaloriesCard = title == 'CALORIES' && percentage != null;
    final bool isWeightCard = title == 'WEIGHT';
    final bool isWaterCard = title == 'WATER';
    final bool isStepsCard = title == 'STEPS';
    final Color backgroundColor = kAccentColor2;

    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 10),
              // 칼로리
              if (isCaloriesCard)
                Flexible(
                  flex: 5,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      PieChart(
                        PieChartData(
                          centerSpaceRadius: 40,
                          sectionsSpace: 0,
                          startDegreeOffset: 270,
                          sections: showingSections(
                              TColor.secondaryColor2, Colors.white24),
                        ),
                      ),
                      Text(
                        '${percentage!.toInt()}%',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              // 몸무게
              if (isWeightCard) ...[
                Flexible(
                  flex: 5,
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(show: false),
                      borderData: FlBorderData(
                        show: false, // 테두리 숨김
                      ),
                      minX: 0,
                      maxX: 7,
                      minY: 0,
                      maxY: 6,
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(0, 3),
                            FlSpot(1, 2),
                            FlSpot(2, 5),
                            FlSpot(3, 3.5),
                            FlSpot(4, 4),
                            FlSpot(5, 3),
                            FlSpot(6, 4),
                          ],
                          isCurved: true,
                          color: TColor.primaryColor2,
                          barWidth: 4,
                          isStrokeCapRound: true,
                          dotData: FlDotData(show: false),
                          belowBarData: BarAreaData(show: false),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              // 물
              if (isWaterCard) ...[
                Flexible(
                  flex: 5,
                  child: ColorFiltered(
                    colorFilter:
                        ColorFilter.mode(TColor.primaryColor2, BlendMode.srcIn),
                    child: Image.asset(
                      'assets/images/water.png',
                      width: 160,
                      height: 160,
                    ),
                  ),
                ),
              ],
              // 걸음수
              if (isStepsCard) ...[
                Flexible(
                  flex: 5,
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(TColor.primaryColor2, BlendMode.srcIn),
                    child: Image.asset(
                      'assets/images/walkman.png', // 이 부분에 걸음수 이미지 경로를 지정합니다.
                      width: 160,
                      height: 160,
                    ),
                  ),
                ),
              ],
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                trailing,
                style: TextStyle(fontSize: 12, color: Colors.grey[200]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections(
      Color fillColor, Color remainingColor) {
    const double sectionRadius = 14;

    return List.generate(2, (i) {
      return PieChartSectionData(
        color: i == 0 ? fillColor : remainingColor,
        value: i == 0 ? percentage ?? 0 : 100 - (percentage ?? 0),
        showTitle: false,
        radius: sectionRadius,
      );
    });
  }
}
