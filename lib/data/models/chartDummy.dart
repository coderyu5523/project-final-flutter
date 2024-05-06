import 'package:fl_chart/fl_chart.dart';

const List<FlSpot> fatData = [
  FlSpot(0, 20),
  FlSpot(1, 18),
  FlSpot(2, 16),
  FlSpot(3, 14),
  FlSpot(4, 12),
];

const List<FlSpot> muscleData = [
  FlSpot(0, 27),
  FlSpot(1, 28),
  FlSpot(2, 29),
  FlSpot(3, 30),
  FlSpot(4, 31),
];

const List<FlSpot> weightData = [
  FlSpot(0, 80),
  FlSpot(1, 78),
  FlSpot(2, 78),
  FlSpot(3, 76),
  FlSpot(4, 75),
];

double maxY(List<FlSpot> spots) {
  return spots.map((spot) => spot.y).reduce((max, y) => y > max ? y : max);
}
