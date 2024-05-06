import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/ui/main/challenge/viewmodel/challenge_view_model.dart';
import 'package:project_app/ui/main/challenge/widgets/available_challenge.dart';
import 'package:project_app/ui/main/challenge/widgets/completed_challenge.dart';
import 'package:project_app/ui/main/challenge/widgets/ongoing_challenge.dart';

class ChallengePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ChallengeListModel? challengeListModel = ref.watch(challengeListProvider);

    if (challengeListModel == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return ListView(
        children: <Widget>[
          AvailableChallenge(
              title: '탐험 시작하기',
              challenges: challengeListModel.upcomingChallengeDTOList),
          OngoingChallenge(
              title: '내 챌린지', challenge: challengeListModel.attendChallenge),
          CompletedChallenge(
              title: '지난 챌린지',
              challenges: challengeListModel.pastChallengesDTOList),
        ],
      );
    }
  }
}
