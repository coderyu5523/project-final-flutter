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
        name = json["name"],
        fat = json["fat"].toDouble(),
        muscle = json["muscle"].toDouble(),
        weight = json["weight"].toDouble(),
        goalMuscle = json["goalMuscle"].toDouble(),
        goalFat = json["goalFat"].toDouble();
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

class AddBodyDTO{
  final double fat;
  final double muscle;
  final double weight;

  AddBodyDTO(this.fat, this.muscle, this.weight);

  AddBodyDTO.fromJson(Map<String, dynamic> json)
      :fat = json["fat"].toDouble(),
        muscle = json["muscle"].toDouble(),
        weight = json["weight"].toDouble();

}
