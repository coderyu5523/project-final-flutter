import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/data/dtos/challenge/challenge_response.dart';
import 'package:project_app/data/dtos/response_dto.dart';
import 'package:project_app/data/repository/challenge_respository.dart';
import 'package:project_app/data/store/session_store.dart';
import 'package:project_app/main.dart';

class ChallengeListModel {
  AttendChallenge attendChallenge;
  List<ChallengeListDTO> upcomingChallengeDTOList;
  List<ChallengeListDTO> pastChallengesDTOList;

  ChallengeListModel(this.attendChallenge, this.upcomingChallengeDTOList,
      this.pastChallengesDTOList);
}

class ChallengeListViewModel extends StateNotifier<ChallengeListModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  ChallengeListViewModel(super._state, this.ref);

  Future<void> notifyInit() async {
    SessionStore sessionStore = ref.read(sessionProvider);
    ResponseDTO responseDTO =
        await ChallengeRepository().getChallengeList(sessionStore.accessToken!);
    ChallengeResponseDTO challengeResponseDTO =
        ChallengeResponseDTO.fromJson(responseDTO.body);
    List<ChallengeListDTO> upcomingChallengeList = challengeResponseDTO
        .upcomingChallenges
        .map((e) => ChallengeListDTO.fromJson(e))
        .toList();
    List<ChallengeListDTO> pastChallengeList = challengeResponseDTO
        .pastchallenges
        .map((e) => ChallengeListDTO.fromJson(e))
        .toList();
    AttendChallenge challenge = AttendChallenge(
        id: challengeResponseDTO.id,
        challengeName: challengeResponseDTO.challengeName,
        subtitle: challengeResponseDTO.subtitle,
        closingTime: challengeResponseDTO.closingTime,
        coin: challengeResponseDTO.coin,
        backImg: challengeResponseDTO.backImg);

    ChallengeListModel challengeListModel = ChallengeListModel(
        challenge, upcomingChallengeList!, pastChallengeList!);

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
