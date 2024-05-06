import 'package:intl/intl.dart';

class MainDTO {
  final int id;
  final String name;
  final double goalFat;
  final double goalMuscle;
  final double fat;
  final double muscle;
  final double weight;

  MainDTO(this.id, this.name, this.goalFat, this.goalMuscle, this.fat,
      this.muscle, this.weight);

  MainDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"] ?? "",
        fat = json["fat"] ?? "",
        muscle = json["muscle"] ?? "",
        weight = json["weight"] ?? 0.0,
        goalMuscle = json["goalMuscle"] ?? 0.0,
        goalFat = json["goalFat"] ?? 0.0;
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
        fat = json["fat"] ?? "",
        muscle = json["muscle"] ?? "",
        weight = json["weight"] ?? 0.0,
        date = DateFormat("yyyy-mm-dd").parse(json["date"]);
}
