class BadgeMenu {
  final String challengeName;
  final String badgeImg;

  BadgeMenu({required this.challengeName, required this.badgeImg});
}

final List<BadgeMenu> available = [
  BadgeMenu(challengeName: '에베레스트', badgeImg: 'assets/1.png'),
  BadgeMenu(challengeName: '그랜드 캐니언 림 트레일', badgeImg: 'assets/1.png'),
];

final List<BadgeMenu> ongoing = [
  BadgeMenu(challengeName: '애팔레치아 트레일', badgeImg: 'assets/1.png'),
  BadgeMenu(challengeName: '산티아고 순례길', badgeImg: 'assets/1.png'),
];

final List<BadgeMenu> completed = [
  BadgeMenu(challengeName: '만리장성', badgeImg: 'assets/1.png'),
];
