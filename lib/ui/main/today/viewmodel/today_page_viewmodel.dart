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
  MainDTO mainDTO;
  List<BodyDataDTO> bodyDataList;
  AddBodyDTO? addBodyDTO;

  TodayPageModel(
      {required this.mainDTO, required this.bodyDataList, this.addBodyDTO});
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
      state = responseDTO.body;
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("불러오기 실패 : ${responseDTO.msg}")));
    }
  }

  Future<void> notifyAddBodyData(AddBodyDataRequestDTO requestDTO) async {
    SessionStore sessionStore = ref.read(sessionProvider);
    ResponseDTO responseDTO = await TodayRepository()
        .fetchUpdateBodyData(requestDTO, sessionStore.accessToken!);


    if (responseDTO.status == 200) {
      AddBodyDTO addBodyDTO = AddBodyDTO.fromJson(responseDTO.body);
      print("111 : ${addBodyDTO.runtimeType}");
      print("222 : ${addBodyDTO.fat}");
      print("333 : ${addBodyDTO.muscle}");
      TodayPageModel model = TodayPageModel(
          mainDTO: state!.mainDTO,
          bodyDataList: state!.bodyDataList,
          addBodyDTO: addBodyDTO);

      state = model;
      Navigator.pop(mContext!);

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
