import 'package:intl/intl.dart';
import 'package:project_app/data/dtos/challenge/challenge_response.dart';

class MainDTO {
  final int id;
  final String name;
  final double goalFat;
  final double goalMuscle;
  final double fat;
  final double muscle;
  final double weight;
  final List<BodyDataDTO> bodyData;

  MainDTO(this.id, this.name, this.goalFat, this.goalMuscle, this.fat,
      this.muscle, this.weight, this.bodyData);

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

class MyPageDTO {
  final int id;
  final String name;
  final double fat;
  final double muscle;
  final double weight;
  final List<ChallengeListDTO> conqueredChallenge;
  final String userImg;

  MyPageDTO(
      {required this.id,
      required this.name,
      required this.fat,
      required this.muscle,
      required this.weight,
      required this.conqueredChallenge,
      required this.userImg});

  MyPageDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        fat = json["fat"].toDouble(),
        muscle = json["muscle"].toDouble(),
        weight = json["weight"].toDouble(),
        conqueredChallenge = (json["conqueredChallenge"] as List)
            .map((e) => ChallengeListDTO.fromJson(e))
            .toList(),
        userImg = json["userImg"];
}


class ProfileUpdateFormDTO {
  final int id;
  final String name;
  final String phone;
  final double height;
  final String userImg;

  ProfileUpdateFormDTO(
      {required this.id,
        required this.name,
        required this.phone,
        required this.height,
        required this.userImg});

  ProfileUpdateFormDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        phone = json["phone"],
        height = json["height"],
        userImg = json["userImg"];
}