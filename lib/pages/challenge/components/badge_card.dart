import 'package:flutter/material.dart';

import 'badge_menu.dart';

class BadgeCard extends StatelessWidget {
  final BadgeMenu badge;

  const BadgeCard({Key? key, required this.badge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(badge.badgeImg),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              badge.challengeName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
