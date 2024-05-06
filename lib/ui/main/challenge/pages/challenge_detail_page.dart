
import 'package:flutter/material.dart';
import 'package:project_app/data/models/challenges/challenge_detail.dart';
import 'package:project_app/ui/main/challenge/widgets/challenge_action_button.dart';
import 'package:project_app/ui/main/challenge/widgets/challenge_content.dart';


class ChallengeDetailPage extends StatelessWidget {
  final ChallengeDetail challenge;

  const ChallengeDetailPage({Key? key, required this.challenge})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(challenge.name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(challenge.backgroundImg, fit: BoxFit.cover),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ChallengeContent(
                name: challenge.name,
                subtitle: challenge.subtitle,
                walking: challenge.walking,
                content: challenge.content,
              ),
            ),
            ChallengeActionButton(status: challenge.status),

          ],
        ),
      ),
    );
  }
}
