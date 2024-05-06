import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../_core/constants/constants.dart';

class StepChart extends StatefulWidget {
  const StepChart({super.key});

  @override
  State<StepChart> createState() => _StepChartState();
}

class _StepChartState extends State<StepChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery
        .of(context)
        .size;
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "걸음수 내역",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
            Container(
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.tealAccent, Colors.teal]),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    items: ["주간", "월간"]
                        .map((name) =>
                        DropdownMenuItem(
                          value: name,
                          child: Text(
                            name,
                            style: TextStyle(
                                color: Colors.grey, fontSize: 14),
                          ),
                        ))
                        .toList(),
                    onChanged: (value) {},
                    icon: Icon(Icons.expand_more, color: Colors.black54),
                    hint: Text(
                      "주간",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: TColor.darkGrey, fontSize: 12),
                    ),
                  ),
                )),
          ],
        ),

        SizedBox(
          height: media.width * 0.05,
        ),

        Container(
          height: media.width * 0.5,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
          decoration: BoxDecoration(
              color: TColor.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 3)
              ]),
          child: BarChart(

              BarChartData(
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (barData) {
                      // barData는 BarChartGroupData의 인스턴스
                      return Colors.grey;
                    },
                    tooltipHorizontalAlignment: FLHorizontalAlignment.right,
                    tooltipMargin: 10,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      String weekDay;
                      switch (group.x) {
                        case 0:
                          weekDay = '월';
                          break;
                        case 1:
                          weekDay = '화';
                          break;
                        case 2:
                          weekDay = '수';
                          break;
                        case 3:
                          weekDay = '목';
                          break;
                        case 4:
                          weekDay = '금';
                          break;
                        case 5:
                          weekDay = '토';
                          break;
                        case 6:
                          weekDay = '일';
                          break;
                        default:
                          throw Error();
                      }
                      return BarTooltipItem(
                        '$weekDay\n',
                        const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: (rod.toY - 1).toString(),
                            style: TextStyle(
                              color: TColor.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  touchCallback: (FlTouchEvent event, barTouchResponse) {
                    setState(() {
                      if (!event.isInterestedForInteractions ||
                          barTouchResponse == null ||
                          barTouchResponse.spot == null) {
                        touchedIndex = -1;
                        return;
                      }
                      touchedIndex =
                          barTouchResponse.spot!.touchedBarGroupIndex;
                    });
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: getTitles,
                      reservedSize: 38,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                barGroups: showingGroups(),
                gridData: FlGridData(show: false),
              )

          ),
        ),
      ],
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    var style = TextStyle(
      color: TColor.grey,
      fontWeight: FontWeight.w500,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('일', style: style);
        break;
      case 1:
        text = Text('월', style: style);
        break;
      case 2:
        text = Text('화', style: style);
        break;
      case 3:
        text = Text('수', style: style);
        break;
      case 4:
        text = Text('목', style: style);
        break;
      case 5:
        text = Text('금', style: style);
        break;
      case 6:
        text = Text('토', style: style);
        break;
      default:
        text = Text('일', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  List<BarChartGroupData> showingGroups() =>
      List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(
                0, 5, TColor.primaryG, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(
                1, 10.5, TColor.secondaryG, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(
                2, 5, TColor.primaryG, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(
                3, 7.5, TColor.secondaryG, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(
                4, 15, TColor.primaryG, isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(
                5, 5.5, TColor.secondaryG, isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(
                6, 8.5, TColor.primaryG, isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });

  BarChartGroupData makeGroupData(int x,
      double y,
      List<Color> barColor,
      {
        bool isTouched = false,

        double width = 22,
        List<int> showTooltips = const [],
      }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          gradient: LinearGradient(colors: barColor,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          width: width,
          borderSide: isTouched
              ? const BorderSide(color: Colors.green)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: TColor.lightGrey,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }
}

