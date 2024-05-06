enum ChallengeStatus { pending, inProgress, completed }

class Challenge {
  final String name;
  final String badgeImg;
  final String subtitle;
  final String distance;
  final int coin;
  final DateTime? closingTime;
  final DateTime? createdAt;
  final ChallengeStatus status;

  Challenge({
    required this.name,
    required this.badgeImg,
    required this.subtitle,
    required this.distance,
    required this.coin,
    this.closingTime,
    this.createdAt,
    this.status = ChallengeStatus.pending, // 기본값은 pending
  });
}
final List<Challenge> upcomingChallenges = [
  Challenge(
      name: "에베레스트",
      distance: "8848m",
      subtitle: "히말라야-네팔\n8848.0m(약 2.7천층 올라감)",
      badgeImg: "assets/images/everest.png",
      coin: 2,
      status: ChallengeStatus.pending
  ),
  Challenge(
      name: "에베레스트 베이스캠프 트레킹",
      distance: "62K",
      subtitle: "히말라야-네팔\n62.0km(약 8.7만개의 계단)",
      badgeImg: "assets/images/basecampEV.png",
      coin: 2,
      status: ChallengeStatus.pending
  ),
  Challenge(
      name: "칠쿠트 트레일",
      distance: "53K",
      subtitle: "코스트산맥-알래스카 및 캐나다\n53.0km(약 7.4만개의 계단)",
      badgeImg: "assets/images/chilkoot.png",
      coin: 2,
      status: ChallengeStatus.pending
  ),
  Challenge(
      name: "엘브루스",
      distance: "5642m",
      subtitle: "코카서스산맥-러시아\n5642.0m(약 1.7천층 올라감)",
      badgeImg: "assets/images/elbrus.png",
      coin: 2,
      status: ChallengeStatus.pending
  ),
  Challenge(
      name: "그랜드 캐니언 림 트레일",
      distance: "21K",
      subtitle: "콜로라도고원-미국\n21.0km(약 3만개의 계단)",
      badgeImg: "assets/images/grandcanyon.png",
      coin: 2,
      status: ChallengeStatus.pending
  ),
  Challenge(
      name: "산티아고 순례길",
      distance: "784K",
      subtitle: "피레네-프랑스 및 스페인\n784.0km(약 110만개의 계단)",
      badgeImg: "assets/images/santiago.png",
      coin: 2,
      status: ChallengeStatus.pending
  ),
  Challenge(
      name: "디날리",
      distance: "6190m",
      subtitle: "알래스카산맥-미국\n6190.0m(약 1.9천층 올라감)",
      badgeImg: "aassets/images/denali.png",
      coin: 2,
      status: ChallengeStatus.pending
  ),
  Challenge(
      name: "잉카 트레일",
      distance: "40K",
      subtitle: "안데스-페루\n40.0km(약 5.6만개의 계단)",
      badgeImg: "assets/images/inca.png",
      coin: 2,
      status: ChallengeStatus.pending
  ),
  Challenge(
      name: "K2",
      distance: "8611m",
      subtitle: "카라코람산맥-파키스탄\n8,611m(약 2.6천층 올라감)",
      badgeImg: "aassets/images/k2.png",
      coin: 2,
      status: ChallengeStatus.pending
  ),
  Challenge(
      name: "킬리만자로",
      distance: "5895m",
      subtitle: "이스턴리프트산맥-탄자니아\n5,895.0m(약 1.8천층 올라감)",
      badgeImg: "assets/images/kili.png",
      coin: 2,
      status: ChallengeStatus.pending
  ),
  Challenge(
      name: "웨스트 하일랜드 웨이",
      distance: "154K",
      subtitle: "하일랜드-스코틀랜드\n154.0km(약 22만개의 계단)",
      badgeImg: "assets/images/west.png",
      coin: 2,
      status: ChallengeStatus.pending
  ),
  Challenge(
      name: "빈슨",
      distance: "4892m",
      subtitle: "엘즈워스산맥-남극대륙\n4,892.0m(약 1.5천층 올라감)",
      badgeImg: "assets/images/vinson.png",
      coin: 2,
      status: ChallengeStatus.pending
  ),
  Challenge(
      name: "라인슈타이크 트레일",
      distance: "320K",
      subtitle: "라인강-독일\n320.0km(약 45만개의 계단)",
      badgeImg: "assets/images/rhein.png",
      coin: 2,
      status: ChallengeStatus.pending
  ),
  Challenge(
      name: "안나푸르나 서킷",
      distance: "260K",
      subtitle: "히말라야-네팔\n260.1km(약 36만개의 계단)",
      badgeImg: "assets/images/anna.png",
      coin: 2,
      status: ChallengeStatus.pending
  ),
  Challenge(
      name: "아콩가과",
      distance: "6961m",
      subtitle: "안데스-아르헨티나\n6,961.0m(약 2.1천층 올라감)",
      badgeImg: "assets/images/acon.png",
      coin: 2,
      status: ChallengeStatus.pending
  ),
];

final List<Challenge> ongoingChallenges = [
  Challenge(
      name: "그로스글로크너",
      distance: "3798m",
      subtitle: "알프스-오스트리아\n3,798.0m(약 1.2천층 올라감)",
      badgeImg: "assets/images/grossglock.png",
      coin: 2,
      createdAt: DateTime.now(),
      closingTime: DateTime.now().add(Duration(days: 30)), // 생성일로부터 30일 후 마감
      status: ChallengeStatus.inProgress
  )
];

final List<Challenge> pastChallenges = [
  Challenge(
      name: "만리장성",
      distance: "20K",
      subtitle: "지엔커우 만리장성(기점 Xizhazi Village)-중국\n20.0km(약 2.8만개의 계단)",
      badgeImg: "assets/images/manri.png",
      coin: 2,
      status: ChallengeStatus.completed
  ),
  Challenge(
      name: "크레이들산 오버랜드 트랙",
      distance: "65K",
      subtitle: "태즈메이니아-호주\n65.0km(약 9.1만개의 계단)",
      badgeImg: "assets/images/cradle.png",
      coin: 2,
      status: ChallengeStatus.completed
  ),
  Challenge(
      name: "애팔래치안 트레일",
      distance: "3500K",
      subtitle: "애팔래치아산맥-미국\n3,500.0km(약 490만개의 계단)",
      badgeImg: "assets/images/appalachian.png",
      coin: 2,
      status: ChallengeStatus.completed
  ),
  Challenge(
      name: "코지어스코",
      distance: "2228m",
      subtitle: "스노이산맥-호주\n2,228.0m(약 675층 올라감)",
      badgeImg: "assets/images/koscius.png",
      coin: 2,
      status: ChallengeStatus.completed
  ),
  Challenge(
      name: "밀퍼드 트랙",
      distance: "53K",
      subtitle: "남섬-뉴질랜드\n53.0km(약 7.4만개의 계단)",
      badgeImg: "assets/images/milford.png",
      coin: 2,
      status: ChallengeStatus.completed
  ),
  Challenge(
      name: "몽블랑",
      distance: "4808m",
      subtitle: "알프스-프랑스 및 이탈리아\n4,808.0m(약 1.5천층 올라감)",
      badgeImg: "assets/images/montblanc.png",
      coin: 2,
      status: ChallengeStatus.completed
  ),
  Challenge(
      name: "몽블랑 서큘러",
      distance: "160K",
      subtitle: "알프스-프랑스, 이탈리아, 스위스\n160.0km(약 22만개의 계단)",
      badgeImg: "assets/images/montcir.png",
      coin: 2,
      status: ChallengeStatus.completed
  ),
  Challenge(
      name: "아라라트",
      distance: "5137m",
      subtitle: "아르메니아고원-터키\n5,137.0m(약 1.6천층 올라감)",
      badgeImg: "assets/images/ararat.png",
      coin: 2,
      status: ChallengeStatus.completed
  ),
  Challenge(
      name: "킬리만자로 마차메 루트",
      distance: "62K",
      subtitle: "이스턴리프트산맥-탄자니아\n62.0km(약 8.7만개의 계단)",
      badgeImg: "assets/images/machame.png",
      coin: 2,
      status: ChallengeStatus.completed
  ),
  Challenge(
      name: "올림푸스",
      distance: "2917m",
      subtitle: "올림푸스산맥-그리스 에비아섬\n2,917.0m(약 885층 올라감)",
      badgeImg: "assets/images/olympus.png",
      coin: 2,
      status: ChallengeStatus.completed
  ),
  Challenge(
      name: "투브칼 서킷",
      distance: "60K",
      subtitle: "아틀라스산맥-모로코\n60.0km(약 8.4만개의 계단)",
      badgeImg: "assets/images/toubkal.png",
      coin: 2,
      status: ChallengeStatus.completed
  ),
  Challenge(
      name: "파타고니아 서킷",
      distance: "120K",
      subtitle: "안데스-파타고니아, 아르헨티나, 칠레\n120.0km(약 17만개의 계단)",
      badgeImg: "assets/images/patagonia.png",
      coin: 2,
      status: ChallengeStatus.completed
  ),
];