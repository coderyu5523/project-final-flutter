import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/data/dtos/challenge/challenge_response.dart';
import 'package:project_app/data/dtos/response_dto.dart';
import 'package:project_app/data/repository/challenge_respository.dart';
import 'package:project_app/main.dart';

class ChallengeListModel {
  AttendChallenge? attendChallenge;
  List<ChallengeListDTO>? upcomingChallengeDTOList;
  List<ChallengeListDTO>? pastChallengesDTOList;

  ChallengeListModel(this.attendChallenge, this.upcomingChallengeDTOList,
      this.pastChallengesDTOList);
}

class ChallengeListViewModel extends StateNotifier<ChallengeListModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  ChallengeListViewModel(super._state, this.ref);

  // 통신 없이 챌린지 시작
  void startChallenge(AttendChallenge attendChallenge) {
    ChallengeListModel prevModel = state!;
    List<ChallengeListDTO> upcomingChallenge =
        prevModel.upcomingChallengeDTOList!;

    upcomingChallenge
        .removeWhere((challenge) => challenge.id == attendChallenge.id);

    ChallengeListModel newModel = ChallengeListModel(
        attendChallenge, upcomingChallenge, prevModel.pastChallengesDTOList);

    state = newModel;
  }

  Future<void> notifyInit() async {
    ResponseDTO responseDTO = await ChallengeRepository().getChallengeList();

    ChallengeResponseDTO challengeResponseDTO =
        ChallengeResponseDTO.fromJson(responseDTO.body);
    List<ChallengeListDTO> upcomingChallengeList = [];
    List<ChallengeListDTO> pastChallengeList = [];

    if (challengeResponseDTO.upcomingChallenges != null) {
      upcomingChallengeList = challengeResponseDTO.upcomingChallenges!
          .map((e) => ChallengeListDTO.fromJson(e))
          .toList();
    }
    if (challengeResponseDTO.pastchallenges != null) {
      pastChallengeList = challengeResponseDTO.pastchallenges!
          .map((e) => ChallengeListDTO.fromJson(e))
          .toList();
    }

    AttendChallenge? challenge;

    if (challengeResponseDTO.id != null) {
      challenge = AttendChallenge(
          id: challengeResponseDTO.id,
          challengeName: challengeResponseDTO.challengeName,
          subtitle: challengeResponseDTO.subtitle,
          closingTime: challengeResponseDTO.closingTime,
          coin: challengeResponseDTO.coin,
          walking: challengeResponseDTO.walking,
          totalWalking: challengeResponseDTO.totalWalking,
          backImg: challengeResponseDTO.backImg);
    }

    ChallengeListModel challengeListModel =
        ChallengeListModel(challenge, upcomingChallengeList, pastChallengeList);

    if (responseDTO.status == 200) {
      state = challengeListModel;
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("챌린지 불러오기 실패 : ${responseDTO.msg}")));
    }
  }
}

final challengeListProvider =
    StateNotifierProvider<ChallengeListViewModel, ChallengeListModel?>((ref) {
  return ChallengeListViewModel(null, ref)..notifyInit();
});
