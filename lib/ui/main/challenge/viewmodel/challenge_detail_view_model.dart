import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/data/dtos/challenge/challenge_request.dart';
import 'package:project_app/data/dtos/response_dto.dart';
import 'package:project_app/data/models/challenges/challenge.dart';
import 'package:project_app/data/repository/challenge_respository.dart';
import 'package:project_app/main.dart';
import 'package:project_app/ui/main/challenge/viewmodel/challenge_view_model.dart';

import '../../../../data/dtos/challenge/challenge_response.dart';

class ChallengeDetailModel {
  ChallengeDetailDTO challengeDetailDTO;

  ChallengeDetailModel(this.challengeDetailDTO);
}

class ChallengeDetailViewModel extends StateNotifier<ChallengeDetailModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  ChallengeDetailViewModel(super._state, this.ref);

  // 챌린지 시작하기
  Future<void> startChallenge(int challengeId) async {
    ChallengeListViewModel challengeListViewModel =
        ref.read(challengeListProvider.notifier);

    Challenge challenge = Challenge(
      id: challengeId,
    );

    ChallengeSaveDTO saveDTO = ChallengeSaveDTO(null, challenge);

    ResponseDTO responseDTO =
        await ChallengeRepository().insertAttendChallenge(saveDTO);

    ChallengeStartDTO challengeStartDTO = responseDTO.body;

    if (responseDTO.status == 200) {
      ChallengeDetailModel challengeDetailModel = state!;
      ChallengeDetailDTO challengeDetailDTO =
          challengeDetailModel.challengeDetailDTO;
      AttendChallenge attendChallenge = AttendChallenge(
        id: challengeId,
        backImg: challengeDetailDTO.backgroundImg,
        challengeName: challengeDetailDTO.challengeName,
        closingTime: challengeStartDTO.closingTime,
        totalWalking: 0,
        coin: challengeDetailDTO.coin,
        subtitle: challengeDetailDTO.subtitle,
        walking: challengeDetailDTO.walking,
      );

      challengeListViewModel.startChallenge(attendChallenge);

      Navigator.pop(mContext!);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("챌린지 시작하기 실패 : ${responseDTO.msg}")));
    }
  }

  // 챌린지 디테일(기본 상태)
  Future<void> notifyInit(int challengeId) async {
    ResponseDTO responseDTO =
        await ChallengeRepository().getChallengeDetail(challengeId);
    if (responseDTO.status == 200) {
      state = ChallengeDetailModel(responseDTO.body);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("챌린지 정보 불러오기 실패 : ${responseDTO.msg}")));
    }
  }
}

final challengeDetailProvider = StateNotifierProvider.family
    .autoDispose<ChallengeDetailViewModel, ChallengeDetailModel?, int>(
        (ref, challengeId) {
  return ChallengeDetailViewModel(null, ref)..notifyInit(challengeId);
});
