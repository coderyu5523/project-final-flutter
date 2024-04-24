import 'package:flutter/material.dart';
import '../../../models/challenge.dart';

class OngoingChallengeDetailPage extends StatelessWidget {
  final Challenge challenge;

  const OngoingChallengeDetailPage({Key? key, required this.challenge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(challenge.name),
      ),
      body: SingleChildScrollView(  // Ensure the content is scrollable
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/challengedetail.png',
                height: 500.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text("${challenge.subtitle}", style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              LinearProgressIndicator(
                value: 0.5,  // Example progress value
                backgroundColor: Colors.grey[300],
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Text("50.2%/100%", style: TextStyle(fontSize: 15)),  // Example step count
                  ),
                  Expanded(
                    child: Text("현재 5만걸음/총 10만걸음", style: TextStyle(fontSize: 15)),  // Example step count
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}