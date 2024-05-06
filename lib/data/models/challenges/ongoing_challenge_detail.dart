enum ChallengeStatus { pending, inProgress, completed }

class OngoingChallengeDetail {
  final String name;
  final String badgeImg;
  final String subtitle;
  final int coin;
  final DateTime? closingTime;
  final ChallengeStatus status;

  OngoingChallengeDetail({
    required this.name,
    required this.badgeImg,
    required this.subtitle,
    required this.coin,
    this.closingTime,
    this.status = ChallengeStatus.pending, // 기본값은 pending
  });
}

final List<OngoingChallengeDetail> ongoingChallenges = [
  OngoingChallengeDetail(
      name: "그로스글로크너",
      subtitle: "알프스-오스트리아\n3,798.0m(약 1.2천층 올라감)",
      badgeImg: "assets/images/grossglock.png",
      coin: 2,
      closingTime: DateTime.now().add(Duration(days: 30)),
      // 생성일로부터 30일 후 마감
      status: ChallengeStatus.inProgress)
];
