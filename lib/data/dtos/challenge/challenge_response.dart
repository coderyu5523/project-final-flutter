class ChallengeResponseDTO {
  final int id;
  final String challengeName; // 챌린지명
  final String subtitle;
  final DateTime closingTime;
  final int coin;
  final String backImg;
  final List<dynamic> upcomingChallenges;
  final List<dynamic> pastchallenges;

  ChallengeResponseDTO(
      {required this.id,
      required this.challengeName,
      required this.subtitle,
      required this.closingTime,
      required this.coin,
      required this.backImg,
      required this.upcomingChallenges,
      required this.pastchallenges});

  factory ChallengeResponseDTO.fromJson(Map<String, dynamic> json) {
    return ChallengeResponseDTO(
      id: json["id"],
      challengeName: json["challengeName"],
      subtitle: json["subtitle"],
      closingTime: DateTime.parse(json["closingTime"]),
      coin: json["coin"],
      backImg: json["backImg"],
      upcomingChallenges: json["upcomingChallenges"],
      pastchallenges: json["pastChallenges"],
    );
  }
}

class AttendChallenge {
  int id;
  String challengeName; // 챌린지명
  String subtitle;
  DateTime closingTime;
  int coin;
  String backImg;

  AttendChallenge(
      {required this.id,
      required this.challengeName,
      required this.subtitle,
      required this.closingTime,
      required this.coin,
      required this.backImg});
}

class ChallengeListDTO {
  int id;
  String challengeName; // 챌린지명
  String distance; // 거리
  String badgeImg;
  bool? status;

  ChallengeListDTO(
      {required this.id,
      required this.challengeName,
      required this.distance,
      required this.badgeImg,
      this.status});

  factory ChallengeListDTO.fromJson(Map<String, dynamic> json) {
    return ChallengeListDTO(
      id: json["id"],
      challengeName: json["challengeName"],
      distance: json["distance"],
      badgeImg: json["badgeImg"],
      status: json["status"],
    );
  }
}
