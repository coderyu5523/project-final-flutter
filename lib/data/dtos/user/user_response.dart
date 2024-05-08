import 'package:intl/intl.dart';



class MyPageDTO {
  final int id;
  final String name;
  final double fat;
  final double muscle;
  final double weight;
  final List<ConqueredChallengeDTO> conqueredChallenge;
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
            .map((e) => ConqueredChallengeDTO.fromJson(e))
            .toList(),
        userImg = json["userImg"];
}

class ConqueredChallengeDTO {
  final int id;
  final String challengeName; // 챌린지명
  final String distance; // 거리
  final bool status;
  final String badgeImg;

  ConqueredChallengeDTO(
      {required this.id,
      required this.challengeName,
      required this.distance,
      required this.status,
      required this.badgeImg});

  ConqueredChallengeDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        challengeName = json["challengeName"],
        distance = json["distance"],
        status = json["status"],
        badgeImg = json["badgeImg"]; // ISO 8601 포맷을 파싱
}
