//창고 데이터
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/data/dtos/response_dto.dart';
import 'package:project_app/data/dtos/today/today_request.dart';
import 'package:project_app/data/store/session_store.dart';
import 'package:project_app/main.dart';

import '../../../../data/dtos/today/today_response.dart';
import '../../../../data/repository/today_repository.dart';

class TodayPageModel {
  MainDTO? mainDTO;
  List<BodyDataDTO>? bodyData;
  GoalFatDTO? goalFatDTO;

  GoalMuscleDTO? goalMuscleDTO;

  GoalWeightDTO? goalWeightDTO;

  TodayPageModel(
      {this.mainDTO,
      this.bodyData,
      this.goalWeightDTO,
      this.goalMuscleDTO,
      this.goalFatDTO});
}

// 창고 창고

class TodayPageViewModel extends StateNotifier<TodayPageModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  TodayPageViewModel(super.state, this.ref);

  Future<void> notifyInit() async {
    SessionStore sessionStore = ref.read(sessionProvider);

    ResponseDTO responseDTO =
        await TodayRepository().fetchMainPage(sessionStore.accessToken!);

    if (responseDTO.status == 200) {
      MainDTO mainDTO = MainDTO.fromJson(responseDTO.body);
      List<BodyDataDTO> bodyData = mainDTO.bodyData;

      TodayPageModel model =
          TodayPageModel(mainDTO: mainDTO, bodyData: bodyData);
      state = model;
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("불러오기 실패 : ${responseDTO.msg}")));
    }
  }

  Future<void> notifyAddBodyData(UpdateBodyDataRequestDTO requestDTO) async {
    SessionStore sessionStore = ref.read(sessionProvider);
    ResponseDTO responseDTO = await TodayRepository()
        .fetchUpdateBodyData(requestDTO, sessionStore.accessToken!);
    TodayPageModel m = state!;

    print("pageModel m : ${m.bodyData!.last.date}");
    if (responseDTO.status == 200) {
      MainDTO mainDTO = MainDTO(
          fat: requestDTO.fat,
          muscle: requestDTO.muscle,
          weight: requestDTO.weight,
          bodyData: m.bodyData!);

      TodayPageModel model =
          TodayPageModel(mainDTO: mainDTO, bodyData: m.bodyData);

      state = model;

      Navigator.pop(mContext!);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("데이터 입력 실패 : ${responseDTO.msg}")));
    }
  }

  Future<void> notifyAddFat(AddGoalDataRequestDTO requestDTO) async {
    SessionStore sessionStore = ref.read(sessionProvider);
    ResponseDTO responseDTO = await TodayRepository()
        .fetchAddGoalFat(requestDTO, sessionStore.accessToken!);

    if (responseDTO.status == 200) {
      GoalFatDTO goalFatDTO = GoalFatDTO(responseDTO.body.fat);
      TodayPageModel model = TodayPageModel(goalFatDTO: goalFatDTO);
      state = model;
    }
  }

  Future<void> notifyAddMuscle(AddGoalDataRequestDTO requestDTO) async {
    SessionStore sessionStore = ref.read(sessionProvider);
    ResponseDTO responseDTO = await TodayRepository()
        .fetchAddGoalMuscle(requestDTO, sessionStore.accessToken!);

    if (responseDTO.status == 200) {
      GoalMuscleDTO goalMuscleDTO = GoalMuscleDTO(responseDTO.body.muscle);
      TodayPageModel model = TodayPageModel(goalMuscleDTO: goalMuscleDTO);
      state = model;
    }
  }

  Future<void> notifyAddWeight(AddGoalDataRequestDTO requestDTO) async {
    SessionStore sessionStore = ref.read(sessionProvider);
    ResponseDTO responseDTO = await TodayRepository()
        .fetchAddGoalWeight(requestDTO, sessionStore.accessToken!);

    if (responseDTO.status == 200) {
      GoalWeightDTO goalWeightDTO = GoalWeightDTO(responseDTO.body.weight);
      TodayPageModel model = TodayPageModel(goalWeightDTO: goalWeightDTO);
      state = model;
    }
  }
}

// 창고 관리자
final TodayPageProvider =
    StateNotifierProvider<TodayPageViewModel, TodayPageModel?>(
  (ref) {
    return TodayPageViewModel(null, ref)..notifyInit();
  },
);
