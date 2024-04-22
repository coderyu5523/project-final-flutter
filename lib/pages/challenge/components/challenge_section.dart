import 'package:flutter/material.dart';
import 'badge_card.dart';
import 'badge_menu.dart';

class ChallengeSection extends StatelessWidget {
  final String title;
  final List<BadgeMenu> badges;

  const ChallengeSection({Key? key, required this.title, required this.badges}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Column(
              children: badges.map((badge) => BadgeCard(badge: badge)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
