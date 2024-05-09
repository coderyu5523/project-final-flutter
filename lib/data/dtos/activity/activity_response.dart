import 'package:intl/intl.dart';

class ChangeBodyDataDTO {
  final int userId;
  final double fat;
  final double muscle;
  final double weight;
  final double goalFat;
  final double goalMuscle;
  final double goalWeight;

  ChangeBodyDataDTO(this.userId, this.fat, this.muscle, this.weight,
      this.goalFat, this.goalMuscle, this.goalWeight);

  ChangeBodyDataDTO.fromJson(Map<String, dynamic> json)
      : userId = json["userId"],
        fat = json["fat"].toDouble(),
        muscle = json["muscle"].toDouble(),
        weight = json["weight"].toDouble(),
        goalWeight = json["goalWeight"].toDouble(),
        goalMuscle = json["goalMuscle"].toDouble(),
        goalFat = json["goalFat"].toDouble();
}

class FatTimeLineDTO {
  final int bodyDateId;
  final double fat;
  final DateTime fatTimeLine;

  FatTimeLineDTO(this.bodyDateId, this.fat, this.fatTimeLine);

  FatTimeLineDTO.fromJson(Map<String, dynamic> json)
      : bodyDateId = json["bodyDateId"],
        fat = json["fat"].toDouble(),
        fatTimeLine =
            DateFormat("yyyy-MM-dd").parse(json["fatTimeLine"], true).toLocal();
}

class MuscleTimeLineDTO {
  final int bodyDateId;
  final double muscle;
  final DateTime muscleTimeLine;

  MuscleTimeLineDTO(this.bodyDateId, this.muscle, this.muscleTimeLine);

  MuscleTimeLineDTO.fromJson(Map<String, dynamic> json)
      : bodyDateId = json["bodyDateId"],
        muscle = json["muscle"].toDouble(),
        muscleTimeLine = DateFormat("yyyy-MM-dd")
            .parse(json["muscleTimeLine"], true)
            .toLocal();
}

class WeightTimeLineDTO {
  int bodyDateId;

  double weight;

  DateTime weightTimeLine;

  WeightTimeLineDTO(this.bodyDateId, this.weight, this.weightTimeLine);

  WeightTimeLineDTO.fromJson(Map<String, dynamic> json)
      : bodyDateId = json["bodyDateId"],
        weight = json["weight"].toDouble(),
        weightTimeLine = DateFormat("yyyy-MM-dd")
            .parse(json["weightTimeLine"], true)
            .toLocal();
}

class FoodNameListDTO {
  final int id;
  final String name;

  FoodNameListDTO(this.id, this.name);

  FoodNameListDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"] ?? null;
}

class FoodContentListDTO {
  final int id;
  final String name;
  final double carbo;
  final double protein;
  final double fat;
  final int kcal;
  final int gram;

  FoodContentListDTO(this.id, this.name, this.carbo, this.protein, this.fat,
      this.kcal, this.gram);

  FoodContentListDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        carbo = json["carbo"].toDouble(),
        protein = json["protein"].toDouble(),
        fat = json["fat"].toDouble(),
        kcal = json["kcal"],
        gram = json["gram"];
}
