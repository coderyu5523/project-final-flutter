import 'package:fl_chart/fl_chart.dart';

import '../../ui/main/today/viewmodel/today_page_viewmodel.dart';


List<FlSpot> FatDataFromModel(TodayPageModel? model) {
  if (model == null || model.bodyDataList.isEmpty) {
    return [];
  }
  final points = model.bodyDataList.takeLast(5).toList();
  // FlSpot 리스트를 생성합니다.
  List<FlSpot> fatData = List.generate(points.length, (index) {
    final bodyDataPoint = points[index];
    return FlSpot(index.toDouble(), bodyDataPoint.fat);
  });
  return fatData;
}



List<FlSpot> MuscleDataFromModel(TodayPageModel? model) {
  if (model == null || model.bodyDataList.isEmpty) {
    return [];
  }
  final points = model.bodyDataList.takeLast(5).toList();

  List<FlSpot> muscleData = List.generate(points.length, (index) {
    final bodyDataPoint = points[index];
    return FlSpot(index.toDouble(), bodyDataPoint.muscle);
  });
  return muscleData;
}

List<FlSpot> WeightDataFromModel(TodayPageModel? model) {
  if (model == null || model.bodyDataList.isEmpty) {
    return [];
  }
  final points = model.bodyDataList.takeLast(5).toList();

  List<FlSpot> weightDataData = List.generate(points.length, (index) {
    final bodyDataPoint = points[index];
    return FlSpot(index.toDouble(), bodyDataPoint.weight);
  });
  return weightDataData;
}


// 이 메서드는 List<T>.takeLast(int n)에 의존합니다.
// Dart의 기본 List API에는 이 메서드가 없으므로, 다음 확장 메서드를 정의해야 합니다.
extension ListExtension<T> on List<T> {
  List<T> takeLast(int n) {
    if (n >= length) return List<T>.from(this);
    return sublist(length - n);
  }
}

// const List<FlSpot> muscleData = [
//   FlSpot(0, 27),
//   FlSpot(1, 28),
//   FlSpot(2, 29),
//   FlSpot(3, 30),
//   FlSpot(4, 31),
// ];

// const List<FlSpot> weightData = [
//   FlSpot(0, 80),
//   FlSpot(1, 78),
//   FlSpot(2, 78),
//   FlSpot(3, 76),
//   FlSpot(4, 75),
// ];



double maxY(List<FlSpot> spots) {
  return spots.map((spot) => spot.y).reduce((max, y) => y > max ? y : max);
}
