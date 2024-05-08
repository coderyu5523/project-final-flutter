import 'package:intl/intl.dart';

class MainDTO {
  final int? id;
  final String? name;
  final double? goalFat;
  final double? goalMuscle;
  final double? fat;
  final double? muscle;
  final double? weight;
  final List<BodyDataDTO> bodyData;

  MainDTO({this.id, this.name, this.goalFat, this.goalMuscle, this.fat,
      this.muscle, this.weight,required this.bodyData});

  MainDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        fat = json["fat"].toDouble(),
        muscle = json["muscle"].toDouble(),
        weight = json["weight"].toDouble(),
        goalMuscle = json["goalMuscle"].toDouble(),
        goalFat = json["goalFat"].toDouble(),
        bodyData = (json["bodyData"] as List)
            .map((e) => BodyDataDTO.fromJson(e))
            .toList();
}

class BodyDataDTO {
  final int id;
  final double fat;
  final double muscle;
  final double weight;
  final DateTime date;

  BodyDataDTO(this.id, this.fat, this.muscle, this.weight, this.date);

  BodyDataDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        fat = json["fat"].toDouble(),
        muscle = json["muscle"].toDouble(),
        weight = json["weight"].toDouble(),
        date = DateFormat("yyyy-MM-dd")
            .parse(json["date"], true)
            .toLocal(); // ISO 8601 포맷을 파싱
}

class GoalFatDTO{
  final double goalFat;
  GoalFatDTO(this.goalFat);

  GoalFatDTO.fromJson(Map<String, dynamic> json):
        goalFat =json["goalFat"].toDouble();
}

class GoalMuscleDTO{
  final double goalMuscle;
  GoalMuscleDTO(this.goalMuscle);

  GoalMuscleDTO.fromJson(Map<String, dynamic> json):
        goalMuscle =json["goalMuscle"].toDouble();
}

class GoalWeightDTO{
  final double goalWeight;
  GoalWeightDTO(this.goalWeight);

  GoalWeightDTO.fromJson(Map<String, dynamic> json):
        goalWeight =json["goalWeight"].toDouble();
}