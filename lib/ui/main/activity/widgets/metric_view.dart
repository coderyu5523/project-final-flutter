import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:project_app/_core/constants/constants.dart';

Widget buildMetricView(String currentLabel, String currentValue, String goalLabel, String goalValue, Color lineColor, List<Color> gradientColors) {
  return CustomScrollView(
    slivers: <Widget>[
      SliverToBoxAdapter(
        child: Container(
          color: kAccentColor2,
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildWeightIndicator(currentLabel, currentValue),
              Container(height: 50, width: 2, color: Colors.white, margin: EdgeInsets.symmetric(horizontal: 55)),
              buildWeightIndicator(goalLabel, goalValue),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: buildWeightGraph(lineColor, gradientColors),
      ),
      SliverList(
        delegate: SliverChildListDelegate([buildTimeline()]),
      ),
    ],
  );
}

Widget buildWeightIndicator(String label, String value) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
      Text(label, style: TextStyle(fontSize: 16, color: Colors.white70)),
    ],
  );
}

Widget buildWeightGraph(Color lineColor, List<Color> gradientColors) {
  return Container(
    height: 200,
    decoration: BoxDecoration(color: kAccentColor2),
    child: LineChart(
      LineChartData(
        gridData: FlGridData(show: true),
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: 6,
        minY: 0,
        maxY: 6,
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 2),
              FlSpot(1, 5),
              FlSpot(2, 3.5),
              FlSpot(3, 4),
              FlSpot(4, 3),
              FlSpot(5, 4),
              FlSpot(6, 4),
            ],
            isCurved: true,
            color: lineColor,
            barWidth: 4,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: gradientColors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildTimeline() {
  List<Map<String, dynamic>> data = [
    {"weight": "58.7 kg", "date": "2024년 5월 1일"},
    {"weight": "60.2 kg", "date": "2024년 5월 2일"},
    {"weight": "56.4 kg", "date": "2024년 5월 3일"},
    {"weight": "56.4 kg", "date": "2024년 5월 4일"},
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(20),
        child: Text("타임라인", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      Stack(
        children: [
          CustomPaint(
            painter: TimelinePainter(data.map((entry) => 60.0 + data.indexOf(entry) * 120).toList()),
            size: Size(40, 400),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Column(
              children: List.generate(data.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data[index]["weight"],
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                              SizedBox(height: 4),
                              Text(data[index]["date"], style: TextStyle(fontSize: 16, color: Colors.grey)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      )
    ],
  );
}

class TimelinePainter extends CustomPainter {
  final List<double> yPositions;

  TimelinePainter(this.yPositions);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = kAccentColor2
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    for (int i = 0; i < yPositions.length; i++) {
      if (i > 0) {
        canvas.drawLine(
          Offset(size.width / 2, yPositions[i - 1]),
          Offset(size.width / 2, yPositions[i]),
          paint,
        );
      }
      canvas.drawCircle(Offset(size.width / 2, yPositions[i]), 10, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
